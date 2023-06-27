import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yourtrainer/features/homePage/ui/profile_nav_view.dart';
import 'package:yourtrainer/features/homePage/chat_nav_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum SampleItem { logout }

Future<void> signOutCurrentUser() async {
  final result = await Amplify.Auth.signOut();
  if (result is CognitoCompleteSignOut) {
    safePrint('Sign out completed successfully');
  } else if (result is CognitoFailedSignOut) {
    safePrint('Error signing user out: ${result.exception.message}');
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
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
    TrainerNavView(),
    ChatNavView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: [
          PopupMenuButton<SampleItem>(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              PopupMenuItem<SampleItem>(
                value: SampleItem.logout,
                child: Text(AppLocalizations.of(context)!.logout),
                onTap: () => signOutCurrentUser(),
              )
            ],
          )
        ],
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
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_bubble),
            label: AppLocalizations.of(context)!.chat,
            backgroundColor: Colors.black,
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class TrainerNavView extends StatelessWidget {
  const TrainerNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.sports)),
                Tab(icon: Icon(Icons.chat)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.sports),
              Icon(Icons.chat),
            ],
          ),
        ),
      ),
    );
  }
}
