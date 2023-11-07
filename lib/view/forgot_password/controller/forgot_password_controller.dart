import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/api.dart';

class ForgotPasswordController extends GetxController {
  final ApiClient api;

  ForgotPasswordController(this.api);

  TextEditingController emailController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> reset() async {
    isLoading.value = true;
    update();
    try {
      final isSuccessful = await api.reset(emailController.text);
      if (isSuccessful) {
        Get.snackbar('Success',
            'Email sent successfully!check tour spam folder if you don\'t find it.',
            duration: const Duration(seconds: 6));
      } else {
        Get.snackbar('error', 'email is not correct');
      }
    } catch (error) {
      // Handle any errors that occurred while creating the user or updating their profile.
      Get.snackbar('error', 'email or password or name are invalid2');
    }
    isLoading.value = false;
    update();
  }
}
