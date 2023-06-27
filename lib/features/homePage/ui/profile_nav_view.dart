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
                title: Text(AppLocalizations.of(context)!.yourExercises),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () => context.goNamed(AppRoute.exerciseList.name),
                leading: const Icon(Icons.sports_martial_arts)),
          )
        ],
      ),
    );
  }
}
