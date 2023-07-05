import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:safezone/constant/app_assets.dart';
import 'package:safezone/constant/app_colors.dart';
import 'package:safezone/screen/nav_page/crime/user_crime_page.dart';
import 'package:safezone/screen/nav_page/map/map_page.dart';
import 'package:safezone/screen/nav_page/messages/message_page.dart';
import 'package:safezone/screen/nav_page/report/report_page.dart';
import 'package:safezone/screen/nav_page/user/user_profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = const [
    MapPage(),
    UserCrimePage(),
    ReportPage(),
    MessagePage(),
    UserProfilePage()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const MapPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: GNav(
        backgroundColor: AppColor.darkBlue, // tab button hover color
        haptic: false, // haptic feedback
        textStyle: const TextStyle(
          fontFamily: "Poppins",
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        tabBorderRadius: 50,
        tabBorder: Border.all(color: Colors.transparent), // tab button border
        tabActiveBorder:
            Border.all(color: Colors.transparent), // tab button shadow
        curve: Curves.easeIn, // tab animation curves
        duration: const Duration(milliseconds: 400), // tab animation duration
        gap: 10, // the tab button gap between icon and text
        color: AppColor.lightGrey, // unselected icon color
        activeColor: Colors.white, // selected icon and text color
        iconSize: 21, // tab button icon size
        tabBackgroundColor: AppColor.orange,
        tabs: const [
          GButton(
            icon: FontAwesomeIcons.earthAfrica,
            text: 'Map',
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            gap: 15,
          ),
          GButton(
            icon: FontAwesomeIcons.bell,
            text: 'Crime',
            padding: EdgeInsets.all(12),
            gap: 15,
          ),
          GButton(
            icon: FontAwesomeIcons.hand,
            text: 'Search',
            padding: EdgeInsets.all(12),
            gap: 15,
          ),
          GButton(
            icon: FontAwesomeIcons.message,
            text: 'Message',
            padding: EdgeInsets.all(12),
            gap: 15,
          ),
          GButton(
            icon: FontAwesomeIcons.user,
            text: 'Profile',
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            gap: 15,
          )
        ],
        onTabChange: (index) {
          setState(() {
            currentScreen = screens[index];
          });
        },
      ),
    );
  }
}
