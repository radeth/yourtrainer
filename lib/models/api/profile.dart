import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:yourtrainer/models/ModelProvider.dart';

Future<Profile?> fetchProfile() async {
  var profile = await getUserProfile();
  safePrint('Existing profile: $profile');
  if (profile == null) {
    profile = await _initProfile();
    safePrint('New profile: $profile');
  }

  return profile;
}

Future<Profile?> _initProfile() async {
  final userIdentity = await Amplify.Auth.getCurrentUser();
  try {
    final profile = Profile(
      name: "MeMeMe", // TODO: profile init
      userId: userIdentity.userId,
      profileType: ProfileType.CUSTOMER,
    );
    final request = ModelMutations.create(profile);
    final response = await Amplify.API.mutate(request: request).response;

    safePrint('_initProfile: $response');

    return response.data;
  } on ApiException catch (e) {
    safePrint("initProfile failed $e");
  }
  return null;
}

Future<Profile?> initTrainerProfile() async {
  final customerProfile = await getUserProfile();
  if (customerProfile == null) {
    return null;
  }
  final trainerProfile = Profile(
      name: customerProfile.name,
      userId: customerProfile.userId,
      profilePicture: customerProfile.profilePicture,
      profileType: ProfileType.TRAINER);

  try {
    final request = ModelMutations.create(trainerProfile);
    final response = await Amplify.API.mutate(request: request).response;

    safePrint('initTrainerProfile: $response');

    return response.data;
  } on ApiException catch (e) {
    safePrint('initTrainerProfile failed: $e');
  }

  return null;
}

Future<Profile?> getUserProfile() async {
  final userIdentity = await Amplify.Auth.getCurrentUser();
  return getProfile(userIdentity.userId);
}

Future<Profile?> getProfile(String userId) async {
  try {
    final queryPredicate = Profile.USERID.eq(userId);

    final request = ModelQueries.list(Profile.classType, where: queryPredicate);
    final response = await Amplify.API.query(request: request).response;
    if (response.data == null || response.data!.items.isEmpty) {
      return null;
    } else if (response.data?.items.length == 1) {
      return response.data!.items.first!;
    } else {
      safePrint("_getProfile found multiple profiles, returning first");
      return response.data!.items.first!;
    }
  } on ApiException catch (e) {
    safePrint("_getProfile failed: $e");
  }
  return null;
}

Future<void> becomeTrainer() async {
  //TODO: some kind of validation
  return;
}
