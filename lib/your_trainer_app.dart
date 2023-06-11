import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home_page.dart';

class YourTrainerApp extends StatefulWidget {
  const YourTrainerApp({
    required this.isAmplifySuccessfullyConfigured,
    Key? key,
  }) : super(key: key);

  final bool isAmplifySuccessfullyConfigured;

  @override
  State<YourTrainerApp> createState() => _YourTrainerAppState();
}

class _YourTrainerAppState extends State<YourTrainerApp> {
  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
          title: 'Your trainer',
          builder: Authenticator.builder(),
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
          home: const HomePage()),
    );
  }
}
