import 'package:authtemplate/data/api/api.dart';
import 'package:authtemplate/view/forgot_password/controller/forgot_password_controller.dart';
import 'package:authtemplate/view/login/controller/login_controller.dart';
import 'package:authtemplate/view/signup/controller/signup_controller.dart';
import 'package:get/get.dart';

import '../../view/reset_password/controller/change_password_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(() => SignUpController(Get.find()));
    Get.lazyPut(() => LoginController(Get.find()));
    Get.lazyPut(() => ForgotPasswordController(Get.find()));
    Get.lazyPut(() => ChangePasswordController(Get.find()));
  }
}
