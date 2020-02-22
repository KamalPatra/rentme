import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_me/favorites_page.dart';
import 'package:rent_me/home_page.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:rent_me/messages_page.dart';
import 'package:rent_me/profile_page.dart';

class NavBar extends StatefulWidget {

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedPage = 0;
  final _pages = [
    HomePage(),
    Favorites(),
    Messages(),
    Profile()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: _pages[_selectedPage],
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.favorite, title: "Favorite"),
            TabData(iconData: Icons.message, title: "Message"),
            TabData(iconData: Icons.person, title: "Profile"),
          ],
          onTabChangedListener: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
        ));
  }
}