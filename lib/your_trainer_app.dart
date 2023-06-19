import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:yourtrainer/common/routes.dart';
import 'package:yourtrainer/features/excersie/ui/exercise_details_page.dart';
import 'package:yourtrainer/features/excersie/ui/exercises_list_page.dart';
import 'package:yourtrainer/models/Exercise.dart';
import 'features/homePage/home_page.dart';
import 'package:yourtrainer/common/colors.dart' as constants;

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
