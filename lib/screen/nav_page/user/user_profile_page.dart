import 'package:flutter/material.dart';
import 'package:safezone/components/text/custom_text.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        child: CustomText(text: "User Profile Page"),
      ),
    );
  }
}
