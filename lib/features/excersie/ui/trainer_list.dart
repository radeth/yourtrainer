import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:yourtrainer/models/ModelProvider.dart';

class TrainerCard extends StatefulWidget {
  final Profile profile;

  const TrainerCard({super.key, required this.profile});
  
  @override
  State<TrainerCard> createState() => _TrainerCardState();
}

class _TrainerCardState extends State<TrainerCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 8,
          shadowColor: Colors.green,
          margin: const EdgeInsets.all(20),
          shape:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), 
              borderSide: const BorderSide(color: Colors.white)
          ),
          child: Column(children: [
            ProfilePicture(name: widget.profile.name, radius: 50, img: widget.profile.profilePicture, fontsize: 40,),
            ListTile( title: Text(widget.profile.name)),
          ]),
        );
  }
}

Widget show_trainer_list(List<Profile> trainers) {
  return ListView.builder(
  shrinkWrap: true,
    itemCount: trainers.length,
    itemBuilder: (context, index) {
      return TrainerCard(profile: trainers[index]);
    });
}

Widget trainer_list_view(List<Profile> trainers) {
  return Scaffold(
    body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Add trainer",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          show_trainer_list(trainers),
        ],
      ),
    ),
  );
}


Future<List<Profile>> getTrainers() async {
  final queryPredicate = Profile.PROFILETYPE.eq(ProfileType.TRAINER);
  try {
    final request = ModelQueries.list(Profile.classType);
    final response = await Amplify.API.query(request: request).response;
    
    final trainers = await response.data?.items;
    if (trainers == null) {
      safePrint('errors: ${response.errors}');
      return const [];
    }
    
    return trainers.whereNotNull().toList();
  } on ApiException catch (e) {
    safePrint("Query failed: $e");
    return [];
  }
}