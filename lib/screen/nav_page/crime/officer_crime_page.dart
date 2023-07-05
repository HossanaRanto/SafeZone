import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safezone/components/buttons/tag_button.dart';
import 'package:safezone/components/text/custom_text.dart';
import 'package:safezone/constant/app_assets.dart';
import 'package:safezone/constant/app_colors.dart';
import 'package:safezone/constant/constant_data.dart';
import 'package:safezone/model/crime_model.dart';
import 'package:safezone/screen/nav_page/crime/crime_details_page.dart';

class OfficerCrimePage extends StatefulWidget {
  const OfficerCrimePage({super.key});

  @override
  State<OfficerCrimePage> createState() => _OfficerCrimePageState();
}

class _OfficerCrimePageState extends State<OfficerCrimePage> {
  int index = 0;
  List<String> filter = ["All", "Vol", "Infraction", "Incident", "Autre"];

  List<CrimeModel> crimeList = [
    ConstantData.crimeModel1,
    ConstantData.crimeModel2,
    ConstantData.crimeModel3,
    ConstantData.crimeModel4,
    ConstantData.crimeModel5,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: const [
                FaIcon(
                  FontAwesomeIcons.solidBell,
                  color: AppColor.orange,
                ),
                SizedBox(
                  width: 20,
                ),
                CustomText(
                  text: "Crime Lists",
                  color: AppColor.orange,
                  size: 35,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filter.length,
                itemBuilder: (context, int i) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: TagButton(
                      color: AppColor.darkBlue,
                      text: filter[i],
                      fillColor: (index == i),
                      onTap: () {
                        setState(() {
                          index = i;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: crimeList.length,
              itemBuilder: (context, int i) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: ConstrainedBox(
                      constraints:
                          const BoxConstraints.expand(height: 250, width: 100),
                      child: crimeList[i].image.isEmpty
                          ? Image.asset(
                              AppAssets.no_image,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              crimeList[i].image,
                              fit: BoxFit.cover,
                            ),
                    ),
                    title: CustomText(
                      text: crimeList[i].title,
                      color: AppColor.darkBlue,
                      size: 18,
                    ),
                    isThreeLine: true,
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text:
                              "Coordination : ${crimeList[i].latitude}, ${crimeList[i].longitude}",
                          overflow: TextOverflow.fade,
                          color: AppColor.lightGrey,
                          size: 12,
                        ),
                        CustomText(
                          text:
                              "Crime type : ${crimeList[i].crimeType}, ${crimeList[i].region}",
                          color: AppColor.lightGrey,
                          overflow: TextOverflow.fade,
                          size: 12,
                        ),
                      ],
                    ),
                    trailing: Column(
                      children: [
                        CustomText(
                          text: crimeList[i].time,
                          color: AppColor.lightGrey,
                          size: 12,
                        ),
                        CustomText(
                          text: crimeList[i].date,
                          color: AppColor.lightGrey,
                          size: 12,
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              CrimeDetailsPage(crimeModel: crimeList[i]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
