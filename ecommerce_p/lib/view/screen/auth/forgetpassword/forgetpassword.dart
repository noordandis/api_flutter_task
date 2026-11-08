
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpasswordcontroller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombutton.dart';
import '../../../widget/auth/customtextbody.dart';
import '../../../widget/auth/customtextform.dart';
import '../../../widget/auth/customtexttitle.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text("14".tr,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
     CustomTextTitleAuth(text: "27".tr),
          const SizedBox(height: 10),
           CustomTextBodyAuth(
              text:
              "24".tr),
          const SizedBox(height: 15),
          CustomTextFormAuth(
            isNumber: false,

            valid: (val) {
              return validInput(val!, 3, 40, "email");
            },
            mycontroller: controller.email,
            hinttext: "12".tr,
            iconData: Icons.email_outlined,
            labeltext: "18".tr,
            // mycontroller: ,
          ),
          CustomButtomAuth(text: "30".tr, onPressed: () {controller.goToVerfiyCode();}),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}