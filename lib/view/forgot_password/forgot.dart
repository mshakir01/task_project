import 'package:authtemplate/core/utils/responsive_size.dart';
import 'package:authtemplate/view/forgot_password/controller/forgot_password_controller.dart';
import 'package:authtemplate/widgets/Text_field.dart';
import 'package:authtemplate/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/text_style.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    ForgotPasswordController controller = Get.find();

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
                onTap: () => Get.back(),
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
                      "Forgot Password?",
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

                            MyTextField(
                              controller: controller.emailController,
                              hintText: "email address",
                              keyboardType: TextInputType.emailAddress,
                              width: width * 0.8,
                            ),
                            SizedBox(
                              height: Responsive.verticalSize(30),
                            ),
                            GetBuilder<ForgotPasswordController>(builder: (cont) {
                              return MyButton(
                                showCircularBar: cont.isLoading.value,
                                onTap: () => cont.reset(),
                                text: "Register",
                              );
                            }),

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
