// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yourtrainer/models/ModelProvider.dart';
import 'package:yourtrainer/models/api/friendship.dart';
import 'package:yourtrainer/widgets/conversation_list_item.dart';

class ChatNavView extends StatefulWidget {
  const ChatNavView({super.key});

  @override
  State<ChatNavView> createState() => _ProfileNavViewState();
}

class _ProfileNavViewState extends State<ChatNavView> {
  @override
  initState() {
    super.initState();
  }

  late List<Friendship> personal_trainers;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: queryPersonalTrainerConnections(),
        builder: (BuildContext context, AsyncSnapshot<List<Friendship>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("No friends"));
          } else {
            if (snapshot.hasError || !snapshot.hasData) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return rehydrate(snapshot.data!);
            }
          }
        });
  }

  Widget rehydrate(List<Friendship> friends) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Conversations",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        onTap: () async {
                          await initFriendList();
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 2, bottom: 2),
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.pink[50],
                          ),
                          child: const Row(
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: Colors.pink,
                                size: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Add New",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            ListView.builder(
              itemCount: friends.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: friends[index].Trainer!.name,
                  friend_id: friends[index].id,
                  message_text: () { 
                    switch (friends[index].connectionState) {
                      case TrainerConnectionState.REQUESTED:
                        return "Requested";
                      case TrainerConnectionState.CONNECTED:
                        return "Connected";
                      default: 
                        return "Removed";
                    }
                  }(),
                  //"", //TODO: last message //friends[index].messageText,
                  profile_picture_url: null, // friends[index].imageURL,
                  time: "1970-01-01",// TODO: last msg time // friends[index].time,
                  //isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}