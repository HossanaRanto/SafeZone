import 'package:flutter/material.dart';
import 'package:safezone/screen/nav_page/crime/officer_crime_page.dart';
import 'package:safezone/screen/nav_page/crime/standard_crime_page.dart';

class UserCrimePage extends StatefulWidget {
  const UserCrimePage({super.key});

  @override
  State<UserCrimePage> createState() => _UserCrimePageState();
}

class _UserCrimePageState extends State<UserCrimePage> {
  bool isOfficerAccount = true;

  @override
  Widget build(BuildContext context) {
    return isOfficerAccount
        ? const OfficerCrimePage()
        : const StandardCrimePage();
  }
}
