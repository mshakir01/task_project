import 'package:authtemplate/core/utils/responsive_size.dart';
import 'package:authtemplate/view/reset_password/controller/change_password_controller.dart';
import 'package:authtemplate/widgets/Text_field.dart';
import 'package:authtemplate/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    String title = "Change\nPassword";
    String imgPath = "assets/images/reset.png";
    ChangePasswordController controller = Get.find();
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
          SingleChildScrollView(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyTextField(
                  controller: controller.oldPasswordController,
                  hintText: "User name",
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  width: width * 0.8,
                  icon: const Icon(Icons.lock, size: 17),
                ),
                SizedBox(
                  height: Responsive.verticalSize(15),
                ),
                MyTextField(
                  controller: controller.newPasswordController,
                  hintText: "password",
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  width: width * 0.8,
                  icon: const Icon(Icons.lock, size: 17),
                ),
                SizedBox(
                  height: Responsive.verticalSize(30),
                ),
                GetBuilder<ChangePasswordController>(builder: (cont) {
                  return MyButton(
                    showCircularBar: cont.isLoading.value,
                    onTap: () => cont.change(),
                    text: "Submit",
                  );
                }),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
