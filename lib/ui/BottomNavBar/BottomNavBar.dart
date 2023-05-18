import 'package:flutter/material.dart';

// enum BottomTabs { home, settings }

class BottomNavBar extends StatelessWidget {
  int selectedTab = 0;
  final Function(int) onTabNavBar;
  BottomNavBar({Key? key, this.selectedTab = 0, required this.onTabNavBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      selectedItemColor: Colors.amber[800],
      currentIndex: selectedTab,
      onTap: onTabNavBar,
    );
  }
}
