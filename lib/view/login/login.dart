
import 'dart:developer';

import 'package:authtemplate/core/constants/colors.dart';
import 'package:authtemplate/router/app_routes.dart';
import 'package:authtemplate/view/login/controller/login_controller.dart';
import 'package:authtemplate/widgets/Text_field.dart';
import 'package:authtemplate/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/text_style.dart';
import '../../home.dart';
import '../../widgets/icon_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController controller = Get.find();

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var email = prefs.get("email");

    log("testing email $email");
    if (email != null) {
      Get.to(Home(email: email.toString()));
    }
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    return Scaffold(
      body: Stack(
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
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  "Login",
                  style: mainText.copyWith(
                    fontSize: 36,
                  ),
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
                              controller: controller.passwordController,
                              hintText: "password",
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
                            InkWell(
                                onTap: () => Get.toNamed(AppRoutes.forgot),
                                child: Text(
                                  "Forget Password",
                                  style: hintStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      isChecked = newValue!;
                                    });
                                  },
                                ),
                                Container(
                                  height: 20,
                                  width: 100,
                                  child: Text("Remember Me"),
                                ),
                              ],
                            ),
                            GetBuilder<LoginController>(builder: (cont) {
                              return MyButton(
                                showCircularBar: cont.isLoading.value,
                                onTap: () => cont.login(),
                                text: "Login",
                              );
                            }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("If you don't Account", style: hintStyle),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.signup),
                              child: Text(
                                "Register",
                                style: GoogleFonts.poppins(color: mainColor),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconBtn(
                              onTap: () {},
                              icon: Icon(Icons.apple),
                            ),
                            SizedBox(width: width * 0.1,),
                            Text("or",style: hintStyle,),
                            SizedBox(width: width * 0.1,),
                            IconBtn(
                              onTap: () {},
                              icon: Icon(Icons.apple),
                            ),


                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
