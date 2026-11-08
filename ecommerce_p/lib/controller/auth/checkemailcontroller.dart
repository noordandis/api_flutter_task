
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routesname.dart';
import '../../view/screen/auth/succsseSignup.dart';

abstract class CheckEmailController extends GetxController {
  checkemail();
  goToVerfiyCodeSignup();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;

  @override
  checkemail() {}

  @override
  goToVerfiyCodeSignup() {
    Get.offNamed(AppRoute.verfiyCodeSignup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}