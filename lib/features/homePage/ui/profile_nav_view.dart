// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yourtrainer/common/routes.dart';
import 'package:yourtrainer/localization_ext.dart';

class ProfileNavView extends StatefulWidget {
  const ProfileNavView({super.key});

  @override
  State<ProfileNavView> createState() => _ProfileNavViewState();
}

class _ProfileNavViewState extends State<ProfileNavView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: ListTile(
              title: Text(AppLocalizations.of(context)!.profile),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => context.pushNamed(AppRoute.profile.name),
              leading: const Icon(Icons.account_circle)
            )
          ),
          Card(
            child: ListTile(
                title: Text(AppLocalizations.of(context)!.yourExercises),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () => context.pushNamed(AppRoute.exerciseList.name),
                leading: const Icon(Icons.sports_martial_arts)),
          ),
          Card(
            child: ListTile(
                title: Text(AppLocalizations.of(context)!.debugMenu),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () => context.pushNamed(AppRoute.debugMenu.name),
                leading: const Icon(Icons.computer_sharp)),
          )
        ],
      ),
    );
  }
}