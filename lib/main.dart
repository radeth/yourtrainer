import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yourtrainer/your_trainer_app.dart';
import 'amplifyconfiguration.dart';
import 'package:yourtrainer/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isAmplifySuccessfullyConfigured = false;
  try {
    await _configureAmplify();
    isAmplifySuccessfullyConfigured = true;
  } on AmplifyAlreadyConfiguredException {
    debugPrint('Amplify configuration failed.');
  }
  // Amplify.Hub.listen(HubChannel.Auth, (event) async {
  //   if (event.eventName == "SIGNED_IN") {
  //     final newUser = User(accountType: AccountType.client.name, email: event.payload?.username);
  //     try {
  //       await Amplify.DataStore.save(newUser);
  //     } on DataStoreException catch (e) {
  //       safePrint('Something went wrong saving model: ${e.message}');
  //     }
  //   }
  // });
  runApp(
    ProviderScope(
      child: YourTrainerApp(
        isAmplifySuccessfullyConfigured: isAmplifySuccessfullyConfigured,
      ),
    ),
  );
}

enum AccountType { client }

Future<void> _configureAmplify() async {
  final datastore = AmplifyDataStore(modelProvider: ModelProvider.instance);
  final api = AmplifyAPI(modelProvider: ModelProvider.instance);
  final cognito = AmplifyAuthCognito();
  await Amplify.addPlugins([
    cognito,
    datastore,
    api,
  ]);
  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    safePrint(
        'Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
  }
}
