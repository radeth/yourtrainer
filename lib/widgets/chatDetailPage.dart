// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:collection/collection.dart';
import 'package:yourtrainer/models/ModelProvider.dart';

class ChatDetailPage extends StatefulWidget {
  final String name;
  final String friend_id;

  const ChatDetailPage({super.key, required this.name, required this.friend_id});

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  Stream<GraphQLResponse<Message>>? operation;
  List<Message> message_history = [];

  void subscribe(String friend_id) {
    final subReq = ModelSubscriptions.onCreate(Message.classType);
    //final Stream<GraphQLResponse<Message>> operation = Amplify.API.subscribe(subReq,
    operation = Amplify.API.subscribe(
      subReq,
      onEstablished: () => safePrint('Subscription esablished'),
    );
    //subscription = operation.listen((event) => {widget.message_history.add(event.data!),)
  }

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
        future: getMessageHistory(widget.friend_id),
        builder: (BuildContext context, AsyncSnapshot<List<Message>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return rehydrate();
          } else {
            if (snapshot.hasError || !snapshot.hasData) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              message_history = snapshot.data!;
              subscribe(widget.friend_id);
              return rehydrate();
            }
          }
        });
  }

  AppBar chat_header() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              ProfilePicture(name: widget.name, radius: 20, fontsize: 15),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "---", // TODO: typ profilu? status online tez moze
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.settings,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget chat_footer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                    hintText: "Write message...",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none),
                onSubmitted: (String message) async {
                  await sendMessage(widget.friend_id, message);
                },
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blue,
              elevation: 0,
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget message_item(MessageDirection direction, String content) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Align(
        alignment: (direction == MessageDirection.INCOMING
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (direction == MessageDirection.OUTGOING
                ? Colors.grey.shade200
                : Colors.blue[200]),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            content,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }

  Widget message_list() {
    return StreamBuilder(
        stream: operation,
        builder: (BuildContext context, snapshot) {
          safePrint('got event $snapshot');
          if (snapshot.hasData) {
            if (snapshot.data!.hasErrors) {
              safePrint('Got GraphQL errors ${snapshot.data!.errors}');
            } else {
              message_history.add(snapshot.data!.data!);
            }
          }
          return Stack(
            children: <Widget>[
              ListView.builder(
                itemCount: message_history.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => message_item(
                    message_history[index].direction,
                    message_history[index].content),
              ),
              chat_footer(),
            ],
          );
        });
  }

  Widget rehydrate() {
    return Scaffold(
      appBar: chat_header(),
      body: message_list(),
      /*
      Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => message_item(messages[index].direction, messages[index].content),
          ),
          chat_footer(),
        ],
      ),
      */
    );
  }
}

const limit = 100; // TODO: proper limiting, pagination etc

Future<List<Message>> getMessageHistory(String friend_id) async {
  //final user_identity = await Amplify.Auth.getCurrentUser();
  final queryPredicate = Message.FRIEND.eq(friend_id);
  try {
    final request = ModelQueries.list(Message.classType,
        limit: limit, where: queryPredicate);
    final response = await Amplify.API.query(request: request).response;

    final messages = response.data?.items;
    if (messages == null) {
      safePrint('errors: ${response.errors}');
      return const [];
    }

    return messages.whereNotNull().toList();
  } on ApiException catch (e) {
    safePrint('Query failed: $e');
    return const [];
  }
}

Future<void> sendMessage(String friend_id, String content) async {
  try {
    final message = Message(
        friend: friend_id,
        content: content,
        direction: MessageDirection.OUTGOING);
    final request = ModelMutations.create(message);
    final response = await Amplify.API.mutate(request: request).response;

    final sendMEssage = response.data;
    if (sendMEssage == null) {
      safePrint('Failed to send: ${response.errors}');
      return;
    }
  } on ApiException catch (e) {
    safePrint("Mutation failed: $e");
  }
}
