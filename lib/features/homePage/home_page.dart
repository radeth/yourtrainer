import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yourtrainer/features/homePage/profile_nav_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ProfileNavView(),
    Text(
      'Index 2: jednostki teningowe',
      style: optionStyle,
    ),
    Text(
      'Index 3: aktywnosc',
      style: optionStyle,
    ),
    Text(
      'Index 3: trener',
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
        // actions: [IconButton(onPressed: onPressed, icon: Ic)],
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
            icon: const Icon(Icons.fitness_center),
            label: AppLocalizations.of(context)!.yourTrainingUnits,
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.stadium),
            label: AppLocalizations.of(context)!.activity,
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.sports),
            label: AppLocalizations.of(context)!.trainer,
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
