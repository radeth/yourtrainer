import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:yourtrainer/common/routes.dart';
import 'package:yourtrainer/features/excersie/ui/exercise_details_page.dart';
import 'package:yourtrainer/features/excersie/ui/exercises_list_page.dart';
import 'package:yourtrainer/features/homePage/ui/home_page.dart';
import 'package:yourtrainer/main.dart';
import 'package:yourtrainer/models/Exercise.dart';
import 'package:yourtrainer/common/colors.dart' as constants;
import 'package:yourtrainer/models/ModelProvider.dart';
import 'package:yourtrainer/models/Profile.dart';
import 'package:yourtrainer/common/colors.dart' as constants;
import 'package:yourtrainer/models/api/profile.dart';
import 'dart:ui';

class YourTrainerApp extends StatelessWidget {
  const YourTrainerApp({
    required this.isAmplifySuccessfullyConfigured,
    Key? key,
  }) : super(key: key);
  final bool isAmplifySuccessfullyConfigured;
  @override
  Widget build(BuildContext context) {
    Amplify.Hub.listen(HubChannel.Auth, (event) async {
      if (event.eventName == "SIGNED_IN") {
        final newUser = User(
            accountType: AccountType.client.name, email: event.payload!.signInDetails.toJson()['username'] as String);
        try {
          await Amplify.DataStore.save(newUser);
        } on DataStoreException catch (e) {
          safePrint('Something went wrong saving model: ${e.message}');
        }
      }
    });
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.home.name,
          builder: (context, state) => isAmplifySuccessfullyConfigured
              ? const HomePage()
              : const Scaffold(
                  body: Center(
                    child: Text(
                      'Tried to reconfigure Amplify; '
                      'this can occur when your app restarts on Android.',
                    ),
                  ),
                ),
        ),
        GoRoute(
          path: '/exerciseList',
          name: AppRoute.exerciseList.name,
          builder: (context, state) {
            return const ExercisesListPage();
          },
        ),
        GoRoute(
          path: '/exerciseDetails/:id',
          name: AppRoute.exerciseDetails.name,
          builder: (context, state) {
            return ExerciseDetailsPage(
              exercise: state.extra! as Exercise,
            );
          },
        ),
        GoRoute(
          path: '/debug',
          name: AppRoute.debugMenu.name,
          builder: (context, state) {
            return ListView(
              children: [
                GestureDetector(
                  onTap: () {}, // TODO: add debug functionality
                  child: const Text("Become trainer")
                )
              ],
            );
          }
        ),
        GoRoute(
          path: '/profile',
          name: AppRoute.profile.name,
          builder: (context, state) {
            return FutureBuilder(
              future: fetchProfile(),
              builder: (BuildContext context, AsyncSnapshot<Profile?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text("Loading"));
                } else {
                  if (snapshot.hasError || !snapshot.hasData) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final name = snapshot.data?.name;
                    return ListView(
                      children: <Widget>[
                        Text('name: $name'),
                      ]
                    );
                  }
                }
              }
            );
          }
        ),
        GoRoute(
          path: '/trainer/:id',
          name: AppRoute.trainerProfile.name,
          builder: (context, state) {
            return const Text("unimplemented");
          }
        )
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    );

    return Authenticator(
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        builder: Authenticator.builder(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: constants.primaryColor)
              .copyWith(background: const Color(0xff82CFEA)),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('pl'),
        ],
      ),
    );
  }
}
