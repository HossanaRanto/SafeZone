import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:safezone/components/text/custom_text.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        child: CustomText(text: "Map Page"),
      ),
    );
  }
}
