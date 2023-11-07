import 'package:authtemplate/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/api/api.dart';

class LoginController extends GetxController {
  final ApiClient api;

  LoginController(this.api);

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    update();
    try {
      final user =
          await api.login(emailController.text, passwordController.text);
      if (user != null) {
        Get.snackbar('Success', 'Logged in successfully!');
        setEmail(user.email!);
        Get.to(Home(email: user.email!));
      } else {
        Get.snackbar('error', 'email or password are incorrect');
      }
    } catch (error) {
      // Handle any errors that occurred while creating the user or updating their profile.
      Get.snackbar('error', 'email or password or name are invalid2');
    }
    isLoading.value = false;
    update();
  }

  Future<void> loginWithGoogle() async {
    try {
      final user = await api.loginWithGoogle();
      if (user != null) {
        Get.snackbar('Success', 'Logged in successfully!');
        Get.to(Home(email: user.email!));
      } else {
        Get.snackbar('error', 'something went wrong');
      }
    } catch (error) {
      // Handle any errors that occurred while creating the user or updating their profile.
      Get.snackbar('error', 'something went wrong');
    }
  }

  setEmail(String email) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }
}
