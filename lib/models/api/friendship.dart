import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:collection/collection.dart';
import 'package:yourtrainer/models/ModelProvider.dart';
import 'package:yourtrainer/models/api/profile.dart';

Future<List<Friendship>> queryPersonalTrainerConnections() async {
  try {
    final request = ModelQueries.list(Friendship.classType);
    final response = await Amplify.API.query(request: request).response;
    
    safePrint("got : $response");

    final friends = response.data?.items;
    if (friends == null) {
      safePrint('errors: ${response.errors}');
      return const [];
    }

    return friends
      .where((Friendship? e) {
        safePrint("proc: $e");
        final valid = e != null && e.Customer != null && e.Trainer != null;
        if (!valid) {
          safePrint("Found invalid Friendship record $e");
        }
        return valid;
      })
      .whereNotNull()
      .toList();

  } on ApiException catch (e) {
    safePrint('Query failed: $e');
    return const [];
  }
}

Future<void> initFriendList() async {
  final myself = (await getUserProfile())!;
  await sendFriendRequest(myself, myself);
}


Future<void> sendFriendRequest(
  Profile client,
  Profile trainer,
  //String client_id,
  //String trainer_id,

  //String messageText,
  //String time,
  //bool isMessageRead,
) async {
  try {
    final friend = Friendship(
        connectionState: TrainerConnectionState.REQUESTED,

        friendshipCustomerId: client.id,
        friendshipTrainerId: trainer.id,
        Customer: client,
        Trainer: trainer,

        //owners: [],
        //owner: "",
        //time: time,
        //isMessageRead: isMessageRead
        );
    safePrint('creating $friend');
    final request = ModelMutations.create(friend);
    final response = await Amplify.API.mutate(request: request).response;

    final createdFriend = response.data;
    safePrint("created: $createdFriend");
    if (createdFriend == null) {
      safePrint('Failed to add friend: ${response.errors}');
      return;
    }
  } on ApiException catch (e) {
    safePrint("Mutation failed: $e");
  }
}
