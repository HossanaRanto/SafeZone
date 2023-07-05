import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safezone/components/buttons/rounded_button.dart';
import 'package:safezone/components/buttons/text_link_button.dart';
import 'package:safezone/components/card/circle_image_card.dart';
import 'package:safezone/components/text/custom_text.dart';
import 'package:safezone/components/text_field/rounded_text_field.dart';
import 'package:safezone/constant/app_assets.dart';
import 'package:safezone/constant/app_colors.dart';
import 'package:safezone/screen/auth/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String fullName = "";
  String email = "";
  String password = "";
  String confirmationPswd = "";
  String address = "";
  bool isOfficerAccountType = false;
  final RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  XFile? imagePicked;
  bool isImageFit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.darkBlue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: (MediaQuery.of(context).size.height / 2) - 50,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColor.darkBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
            Positioned(
              child: BounceInDown(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 80,
                            ),
                            height: 650,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              elevation: 20,
                              child: Container(
                                margin: const EdgeInsets.only(top: 80),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          const CustomText(
                                            text: "Sign Up",
                                            size: 30,
                                            color: AppColor.darkBlue,
                                          ),
                                          CustomText(
                                            text: isOfficerAccountType
                                                ? "(Officer Account)"
                                                : "(Standard Account)",
                                            size: 12,
                                            color: AppColor.lightGrey,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          FlutterSwitch(
                                            value: isOfficerAccountType,
                                            onToggle: (value) {
                                              setState(() {
                                                isOfficerAccountType =
                                                    !isOfficerAccountType;
                                              });
                                            },
                                            toggleColor: Colors.white,
                                            activeColor: AppColor.orange,
                                            width: 46,
                                            height: 24,
                                            padding: 1,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: RoundedTextField(
                                          hintText: "Enter your full name",
                                          icon: FontAwesomeIcons.user,
                                          onChange: (value) {
                                            setState(() {
                                              fullName = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "This case is required!";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: RoundedTextField(
                                          hintText: "Enter your email address",
                                          icon: FontAwesomeIcons.envelope,
                                          onChange: (value) {
                                            setState(() {
                                              email = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "This case is required!";
                                            }
                                            if (!emailValid.hasMatch(value)) {
                                              return "Enter a valid email format";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: RoundedTextField(
                                          hintText: "Enter your address",
                                          icon: FontAwesomeIcons.house,
                                          onChange: (value) {
                                            setState(() {
                                              address = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "This case is required!";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: RoundedTextField(
                                          hintText: "Enter your password",
                                          icon: FontAwesomeIcons.lock,
                                          obscureText: true,
                                          onChange: (value) {
                                            setState(() {
                                              password = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "This case is required!";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: RoundedTextField(
                                          hintText:
                                              "Confirmation of the password",
                                          icon: FontAwesomeIcons.userLock,
                                          obscureText: true,
                                          onChange: (value) {
                                            setState(() {
                                              confirmationPswd = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "This case is required!";
                                            }
                                            if (value != password) {
                                              return "Password doesn't match";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: RoundedButton(
                                          text: "Register".toUpperCase(),
                                          backgroundColor: AppColor.orange,
                                          onClick: () {
                                            if (_formKey.currentState!
                                                    .validate() &&
                                                imagePicked != null) {
                                              // Do something
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleImageCard(
                                isImageFit: isImageFit,
                                image: imagePicked != null
                                    ? Image.file(
                                        File(imagePicked!.path),
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(AppAssets.user_image),
                                onClick: () async {
                                  final picker = ImagePicker();
                                  final XFile? image = await picker
                                      .pickImage(
                                        source: ImageSource.camera,
                                        preferredCameraDevice:
                                            CameraDevice.front,
                                      )
                                      .whenComplete(() => setState(() {}));

                                  if (image == null) {
                                    const ScaffoldMessenger(
                                      child: CustomText(
                                        text: "No image selected",
                                      ),
                                    );
                                  }

                                  imagePicked = image;
                                  setState(() {
                                    isImageFit = (imagePicked != null);
                                  });
                                },
                              ),
                              Positioned(
                                right: 15,
                                bottom: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  width: 30,
                                  height: 30,
                                  child: const Center(
                                      child:
                                          FaIcon(FontAwesomeIcons.penToSquare)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
