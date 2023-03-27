import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../screens/Profilepage/profile.dart';
import '../screens/help/help.dart';
import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/settings/settings.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key, user});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static User? firebaseUser = FirebaseAuth.instance.currentUser;
  int _selectedIndex = 0;
  static List<Widget> pages = <Widget>[
    Home(user: firebaseUser!),
    Settings(user: firebaseUser!),
    const Profile(),
    const Help()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Scaffold(
          body: pages[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                backgroundColor: Colors.black,
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                backgroundColor: Colors.black,
                label: 'settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                backgroundColor: Colors.black,
                label: 'profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.question_mark_rounded),
                backgroundColor: Colors.black,
                label: 'help',
              ),
            ],
          ),
        ));
  }
}
