import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:yourtrainer/common/routes.dart';
import 'package:yourtrainer/features/excersie/ui/exercise_details_page.dart';
import 'package:yourtrainer/features/excersie/ui/exercises_list_page.dart';
import 'package:yourtrainer/features/excersie/ui/profile_page.dart';
import 'package:yourtrainer/features/excersie/ui/trainer_list.dart';
import 'package:yourtrainer/models/Exercise.dart';
import 'package:yourtrainer/models/Profile.dart';
import 'features/homePage/home_page.dart';
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
                  onTap: () async {
                    final trainer_profile = await initTrainerProfile();
                    safePrint('trainer profile: $trainer_profile');
                  }, // TODO: add debug functionality
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
                if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                  return const Center(child: Text("Loading"));
                } else {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ProfilePage(profile: snapshot.data!);
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
        ),
        GoRoute(
          path: '/trainerList',
          name: AppRoute.trainerList.name,
          builder: (context, state) {
            return FutureBuilder(
              future: getTrainers(),
              builder: (BuildContext context, AsyncSnapshot<List<Profile>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                  return const Center(child: Text("Loading"));
                } else {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return trainer_list_view(snapshot.data!);
                  }
                }
              }
            );
          }
        ),
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
