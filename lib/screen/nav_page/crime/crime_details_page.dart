import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safezone/components/text/custom_text.dart';
import 'package:safezone/constant/app_assets.dart';
import 'package:safezone/constant/app_colors.dart';
import 'package:safezone/model/crime_model.dart';

class CrimeDetailsPage extends StatefulWidget {
  final CrimeModel crimeModel;

  const CrimeDetailsPage({super.key, required this.crimeModel});

  @override
  State<CrimeDetailsPage> createState() => _CrimeDetailsPageState();
}

class _CrimeDetailsPageState extends State<CrimeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverLayoutBuilder(builder: (context, constraints) {
              return SliverAppBar(
                foregroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  background: widget.crimeModel.image.isEmpty
                      ? Image.asset(
                          AppAssets.no_image,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          widget.crimeModel.image,
                          fit: BoxFit.cover,
                        ),
                ),
                pinned: true,
                elevation: 0,
                backgroundColor: AppColor.lightGrey,
                expandedHeight: 250,
              );
            }),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: widget.crimeModel.title,
                          bold: true,
                          size: 30,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 12,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
