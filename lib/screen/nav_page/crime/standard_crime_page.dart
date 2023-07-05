import 'package:flutter/material.dart';
import 'package:safezone/components/text/custom_text.dart';

class StandardCrimePage extends StatefulWidget {
  const StandardCrimePage({super.key});

  @override
  State<StandardCrimePage> createState() => _StandardCrimePageState();
}

class _StandardCrimePageState extends State<StandardCrimePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        child: CustomText(text: "Stadard Crime Page"),
      ),
    );
  }
}
