import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safezone/components/buttons/rounded_button.dart';
import 'package:safezone/components/buttons/text_link_button.dart';
import 'package:safezone/components/card/circle_image_card.dart';
import 'package:safezone/components/text/custom_text.dart';
import 'package:safezone/components/text_field/rounded_text_field.dart';
import 'package:safezone/constant/app_assets.dart';
import 'package:safezone/constant/app_colors.dart';
import 'package:safezone/screen/auth/sign_up_screen.dart';
import 'package:safezone/screen/nav_page/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  final RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: (MediaQuery.of(context).size.height / 2),
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
                            height: 450,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              elevation: 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CustomText(
                                    text: "Login",
                                    size: 30,
                                    color: AppColor.darkBlue,
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: RoundedTextField(
                                      hintText: "Enter your email address",
                                      icon: FontAwesomeIcons.user,
                                      onChange: (value) {
                                        setState(() {
                                          email = value;
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
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
                                      hintText: "Enter your password",
                                      icon: FontAwesomeIcons.lock,
                                      obscureText: true,
                                      onChange: (value) {
                                        setState(() {
                                          password = value;
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
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
                                    child: RoundedButton(
                                      text: "Connect".toUpperCase(),
                                      backgroundColor: AppColor.orange,
                                      onClick: () {
                                        if (_formKey.currentState!.validate()) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  const MainScreen(),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CircleImageCard(
                            image: Image.asset(AppAssets.user_image),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextLinkButton(
                  text: "I Don't have an account !",
                  textColor: AppColor.darkBlue,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignUpScreen(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
