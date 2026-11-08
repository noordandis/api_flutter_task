
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/resetpasswordcontroller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombutton.dart';
import '../../../widget/auth/customtextbody.dart';
import '../../../widget/auth/customtextform.dart';
import '../../../widget/auth/customtexttitle.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text("44".tr,
            ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
           CustomTextTitleAuth(text: "35".tr),
          const SizedBox(height: 10),
          CustomTextBodyAuth(
              text:
              "34".tr),
          const SizedBox(height: 15),
          CustomTextFormAuth(
            isNumber: false,

            valid: (val) {
              return validInput(val!, 3, 40, "password");
            },
            mycontroller: controller.password,
            hinttext: "43".tr,
            iconData: Icons.lock_outline,
            labeltext: "19".tr,
            // mycontroller: ,
          ),   CustomTextFormAuth(
            isNumber: false,

            valid: (val) {
              return validInput(val!, 3, 40, "");
            },
            mycontroller: controller.password,
            hinttext: "42".tr,
            iconData: Icons.lock_outline,
            labeltext: "19".tr,
            // mycontroller: ,
          ),
          CustomButtomAuth(text: "33".tr, onPressed: () {
            controller.goToSuccessResetPassword();
          }),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}