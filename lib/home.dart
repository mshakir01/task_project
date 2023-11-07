import 'package:authtemplate/data/api/api.dart';
import 'package:authtemplate/router/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  final String email;
  const Home({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.reset),
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () async {
              await Get.find<ApiClient>().logout();
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove("email");
              Get.toNamed(AppRoutes.login);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            children: [const Text("email: "), Text(email)],
          ),
        const   Row(
            children: [
               Text("is email verified: "),
              // Text(user.emailVerified??.toString())
            ],
          ),
        ],
      ),
    );
  }
}
