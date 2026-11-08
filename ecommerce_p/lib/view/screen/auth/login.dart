import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../controller/auth/logincontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombutton.dart';
import '../../widget/auth/customsignup.dart';
import '../../widget/auth/customtextbody.dart';
import '../../widget/auth/customtextform.dart';
import '../../widget/auth/customtexttitle.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('9'.tr),
      ),
      body: WillPopScope(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                CustomTextTitleAuth(text: "10".tr),
                const SizedBox(height: 10),
                CustomTextBodyAuth(text: "11".tr),
                const SizedBox(height: 65),
                CustomTextFormAuth(
                  isNumber: false,

                  valid: (val) {
                    return validInput(val!, 5, 100, "email");
                  },
                  mycontroller: controller.email,
                  hinttext: "12".tr,
                  iconData: Icons.email_outlined,
                  labeltext: "18".tr,
                  // mycontroller: ,
                ),
                GetBuilder<LoginControllerImp>(builder: (controller)=>CustomTextFormAuth(
                  isNumber: false,
                  obscureText: controller.isShowPassword,
                  onTapIcon: (){
                    controller.ShowPasspword();
                  },
                  valid: (val) {
                    return validInput(val!, 3, 40, "password");
                  },
                  hinttext: "13".tr,
                  iconData: Icons.lock_outline,
                  labeltext: "19".tr,
                  mycontroller: controller.password,
                  // mycontroller: ,
                ),),
                InkWell(
                  onTap: () {
                    controller.goToForgetPassword();
                  },
                  child: Text("14".tr, textAlign: TextAlign.end),
                ),
                CustomButtomAuth(
                  text: "15".tr,
                  onPressed: () {
                    controller.login();
                  },
                ),
                const SizedBox(height: 30),
                CustomTextSignUpOrSignIn(
                  textone: "16".tr,
                  texttwo: "17".tr,
                  onTap: () {
                    controller.goToSignUp();
                  },
                ),
              ],
            ),
          ),
        ),
        onWillPop: alertExitApp,
      ),
    );
  }
}
