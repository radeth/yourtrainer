// ignore_for_file: non_constant_identifier_names

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:yourtrainer/models/Friend.dart';
import 'package:yourtrainer/widgets/chatDetailPage.dart';
import 'package:collection/collection.dart';

class ConversationList extends StatefulWidget {
  final String name;
  final String friend_id;
  final String messageText;
  final String? imageUrl;
  final String time;
  final bool isMessageRead;

  const ConversationList(
      {required this.name,
      required this.friend_id,
      required this.messageText,
      this.imageUrl,
      required this.time,
      required this.isMessageRead});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatDetailPage(name: widget.name, friend_id: widget.friend_id);
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  ProfilePicture(name: widget.name, radius: 30, fontsize: 21),
                  /*
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  */
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.messageText,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: widget.isMessageRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: widget.isMessageRead
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Friend>> queryListItems() async {
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
