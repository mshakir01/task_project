import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/api.dart';

class SignUpController extends GetxController {
  final ApiClient api;

  SignUpController(this.api);

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> register() async {
    isLoading.value = true;
    update();
    try {
      final user = await api.registerUser(
          nameController.text, emailController.text, passwordController.text);
      if (user != null) {
        Get.snackbar('Success', 'User registered successfully!');
      } else {
        Get.snackbar('error', 'email or password or name are invalid');
      }
    } catch (error) {
      // Handle any errors that occurred while creating the user or updating their profile.
      Get.snackbar('error', 'email or password or name are invalid2');
    }
    isLoading.value = false;
    update();
  }
}
