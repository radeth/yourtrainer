import 'package:flutter/material.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:yourtrainer/models/Friend.dart';
import 'package:collection/collection.dart';
import 'package:yourtrainer/widgets/conversationList.dart';

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

  late List<Friend> chatUsers;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: queryFriendsList(),
        builder: (BuildContext context, AsyncSnapshot<List<Friend>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("No friends"));
          } else {
            if (snapshot.hasError || !snapshot.hasData) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              if (snapshot.data!.isEmpty) {
                //initFriendList();
              }
              return rehydrate(snapshot.data!);
            }
          }
        });
  }

  Widget rehydrate(List<Friend> friends) {
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
                  name: friends[index].name,
                  friend_id: friends[index].id,
                  messageText: friends[index].messageText,
                  imageUrl: null, // friends[index].imageURL,
                  time: friends[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Friend>> queryFriendsList() async {
  try {
    final request = ModelQueries.list(Friend.classType);
    final response = await Amplify.API.query(request: request).response;

    final friends = response.data?.items;
    if (friends == null) {
      safePrint('errors: ${response.errors}');
      return const [];
    }
    return friends.whereNotNull().toList();
  } on ApiException catch (e) {
    safePrint('Query failed: $e');
    return const [];
  }
}

Future<void> initFriendList() async {
  await addFriend("Self", "", "", false);
}

Future<void> addFriend(
  String name,
  String messageText,
  String time,
  bool isMessageRead,
) async {
  try {
    final friend = Friend(
        name: name,
        messageText: messageText,
        time: time,
        isMessageRead: isMessageRead);
    final request = ModelMutations.create(friend);
    final response = await Amplify.API.mutate(request: request).response;

    final createdFriend = response.data;
    if (createdFriend == null) {
      safePrint('Failed to add friend: ${response.errors}');
      return;
    }
  } on ApiException catch (e) {
    safePrint("Mutation failed: $e");
  }
}
