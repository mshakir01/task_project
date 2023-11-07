import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/api.dart';

class ChangePasswordController extends GetxController {
  final ApiClient api;

  ChangePasswordController(this.api);

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> change() async {
    isLoading.value = true;
    update();
    try {
      final isSuccessful = await api.change(oldPasswordController.text, newPasswordController.text);
      if (isSuccessful) {
        Get.snackbar('Success',
            'your password have been updated',
            duration: const Duration(seconds: 6));
      } else {
        Get.snackbar('error', 'something went wrong');
      }
    } catch (error) {
      // Handle any errors that occurred while creating the user or updating their profile.
      Get.snackbar('error', 'something went wrong');
    }
    isLoading.value = false;
    update();
  }
}
