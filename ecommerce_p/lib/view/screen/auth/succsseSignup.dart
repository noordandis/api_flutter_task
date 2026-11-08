
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../controller/auth/successsignupcontroller.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/custombutton.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
    Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text("32".tr,
       ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primarycolor,
              )),
          Text("37".tr,
             ),
          Text("38".tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "31".tr,
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}