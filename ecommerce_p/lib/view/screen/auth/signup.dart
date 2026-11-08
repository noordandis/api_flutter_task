

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signupcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombutton.dart';
import '../../widget/auth/customsignup.dart';
import '../../widget/auth/customtextbody.dart';
import '../../widget/auth/customtextform.dart';
import '../../widget/auth/customtexttitle.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 Get.lazyPut(()=>SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('17'.tr,
 ),
      ),
      body: WillPopScope(child: GetBuilder<SignUpControllerImp>(builder: (controller)=>Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            const SizedBox(height: 20),
        CustomTextTitleAuth(text: "10".tr),
            const SizedBox(height: 10),
             CustomTextBodyAuth(
                text:
                "24".tr),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              isNumber: false,

              valid: (val) {
                return validInput(val!, 3, 40, "username");
              },
              mycontroller: controller.username,
              hinttext: "23".tr,
              iconData: Icons.person_outline,
              labeltext: "20".tr,

            ),
            CustomTextFormAuth(
              isNumber: false,

              valid: (val) {
                return validInput(val!, 3, 40, "email");
              },
              mycontroller: controller.email,
              hinttext: "12".tr,
              iconData: Icons.email_outlined,
              labeltext: "18".tr,

            ),
            CustomTextFormAuth(
              isNumber: true,

              valid: (val) {
                return validInput(val!, 3, 40, "phone");
              },
              mycontroller: controller.phone,
              hinttext: "22".tr,
              iconData: Icons.phone_android_outlined,
              labeltext: "21".tr,

            ),
            CustomTextFormAuth(
              isNumber: false,

              valid: (val) {
                return validInput(val!, 3, 40, "password");
              },
              mycontroller: controller.password,
              hinttext: "13".tr,
              iconData: Icons.lock_outline,
              labeltext: "19".tr,

            ),
            CustomButtomAuth(text: "17".tr, onPressed: () {
              controller.signUp();
            }),
            const SizedBox(height: 40),
            CustomTextSignUpOrSignIn(
              textone: "25".tr,
              texttwo: "26".tr,
              onTap: () {
                controller.goToSignIn();
              },
            ),
          ]),
        ),
      ),), onWillPop: alertExitApp)
    );
  }
}