import 'package:flutter/material.dart';

import '../../utils/func.dart';
import 'NavBarIcon.dart';

// enum BottomTabs { home, settings }

class BottomNavBar extends StatelessWidget {
  int selectedTab = 0;
  final Function(int) onTabNavBar;
  BottomNavBar({Key? key, this.selectedTab = 0, required this.onTabNavBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: NavBarIcon(
              isActive: false,
              iconPath: 'assets/images/icons/home.svg',
            ),
            label: 'Home',
            activeIcon: NavBarIcon(
              isActive: true,
              iconPath: 'assets/images/icons/home.svg',
            ),
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(
              isActive: false,
              iconPath: 'assets/images/icons/search.svg',
            ),
            label: 'Search',
            activeIcon: NavBarIcon(
              isActive: true,
              iconPath: 'assets/images/icons/search.svg',
            ),
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(
              isActive: false,
              iconPath: 'assets/images/icons/bookmark.svg',
            ),
            label: 'Save',
            activeIcon: NavBarIcon(
              isActive: true,
              iconPath: 'assets/images/icons/bookmark.svg',
            ),
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(
              isActive: false,
              iconPath: 'assets/images/icons/settings.svg',
            ),
            label: 'Settings',
            activeIcon: NavBarIcon(
              isActive: true,
              iconPath: 'assets/images/icons/settings.svg',
            ),
          ),
        ],
        selectedItemColor: hexToColor('#1DAEFF'),
        unselectedItemColor: hexToColor('#67686D'),
        backgroundColor: hexToColor('#0C0C24'),
        currentIndex: selectedTab,
        onTap: onTabNavBar,
        selectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        // selectedLabelStyle: const TextStyle(fontSize: 12),
      ),
    );
  }
}
