import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentplanner/constants/color.dart';
import 'package:studentplanner/screens/screen_chat.dart';
import 'package:studentplanner/screens/screen_profile.dart';
import 'package:studentplanner/screens/screen_schedule.dart';
import 'package:studentplanner/presentation/schedule_icons.dart'as IconsCustom;
import 'package:studentplanner/screens/screen_search.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _buildBody = <Widget>[ScheduleScreen(), ChatScreen(), SearchScreen(), ProfileScreen() ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        backgroundColor: Color.fromARGB(255, 232, 232, 234),
        selectedIconTheme: IconThemeData(color: MainColor.lightBlue),
        unselectedIconTheme: IconThemeData(color: MainColor.lightGray),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(IconsCustom.Schedule.briefcase),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconsCustom.Schedule.bubble),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconsCustom.Schedule.magnifyingglass),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconsCustom.Schedule.person),
            label: "Profile",
          ),
        ],
      ),
      body: _buildBody[currentIndex],
    );
  }
}
