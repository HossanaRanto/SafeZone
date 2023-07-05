import 'package:flutter/material.dart';
import 'package:safezone/components/text/custom_text.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        child: CustomText(text: "Report Page"),
      ),
    );
  }
}
