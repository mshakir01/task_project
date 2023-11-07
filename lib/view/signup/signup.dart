import 'package:authtemplate/core/constants/colors.dart';
import 'package:authtemplate/core/utils/responsive_size.dart';
import 'package:authtemplate/router/app_routes.dart';
import 'package:authtemplate/view/signup/controller/signup_controller.dart';
import 'package:authtemplate/widgets/Text_field.dart';
import 'package:authtemplate/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/text_style.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    String title = "Register";
    String imgPath = "assets/images/signup.png";
    final SignUpController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              leading: GestureDetector(
                child: const Icon(Icons.arrow_back_ios,
                    color: Colors.grey, size: 16),
                onTap: () => Navigator.of(context).pop(),
              ),
              backgroundColor:
                  Colors.transparent, //You can make this transparent
              elevation: 0.0, //No shadow
            ),
          ),
          Stack(
            children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  kBackColor,
                  kBackSecColor,
                  kGreyTextColor,
                  kGreyTextColor,
                ],
              ),
            ),




          ),
          Positioned(
            top: 160,
            child: Container(
              height: 100,
              width: 415,
              child: Padding(
                padding:  EdgeInsets.only(left: 30.0),
                child: Text(
                  "Signup",
                  style: mainText.copyWith( fontSize: 36,),
                ),
              ),

            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 600,
              width: 415,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      kGreyTextColor,
                      kBorderColorTextField,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  )),
            ),
          ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 580,
                  width: 390,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          kPremiumPlanColor2,
                          kPremiumPlanColor2,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Username",
                                      style: textStyle,
                                    )),
                                MyTextField(
                                  controller: controller.emailController,
                                  hintText: "email address",
                                  keyboardType: TextInputType.emailAddress,
                                  width: width * 0.8,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Password",
                                      style: textStyle,
                                    )),

                                MyTextField(
                                  hintText: "password",
                                  controller: controller.passwordController,
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  width: width * 0.8,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GetBuilder<SignUpController>(builder: (cont) {
                                  return MyButton(
                                    showCircularBar: cont.isLoading.value,
                                    onTap: () => cont.register(),
                                    text: "Signup",
                                  );
                                }),
                              ],
                            ),
                            SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                                ),
                                GestureDetector(
                                  onTap: () => Get.toNamed(AppRoutes.login),
                                  child: Text(
                                    "Login",
                                    style: GoogleFonts.poppins(color: mainColor),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Responsive.verticalSize(15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),









            ],
          ),
        ],
      ),
    );
  }
}
