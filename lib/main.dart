import 'package:authtemplate/core/utils/initial_bindings.dart';
import 'package:authtemplate/firebase_options.dart';
import 'package:authtemplate/router/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Auth Template',
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.pages,
      initialBinding: InitialBindings(),
    );
  }
}

// width: 360
// height: 687
