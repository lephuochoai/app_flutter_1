import 'package:flutter/material.dart';

import '../../ui/BottomNavBar/BottomNavBar.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int selectedTab = 0;

  void onChangeBottomTab(index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Text('13123'),
      ),
      bottomNavigationBar: BottomNavBar(
          selectedTab: selectedTab, onTabNavBar: onChangeBottomTab),
    );
  }
}
