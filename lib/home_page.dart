import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:yourtrainer/common/routes.dart';
import 'package:yourtrainer/features/excersie/ui/exercises_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ProfileNavView(),
    ExercisesListPage(),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_2),
            label: AppLocalizations.of(context)!.profile,
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.sports_martial_arts),
            label: AppLocalizations.of(context)!.yourExercises,
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class ExerciesNavView extends StatefulWidget {
  const ExerciesNavView({super.key});

  @override
  State<ExerciesNavView> createState() => _ExerciesNavViewState();
}

class _ExerciesNavViewState extends State<ExerciesNavView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ProfileNavView extends StatefulWidget {
  const ProfileNavView({super.key});

  @override
  State<ProfileNavView> createState() => _ProfileNavViewState();
}

class _ProfileNavViewState extends State<ProfileNavView> {
  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
