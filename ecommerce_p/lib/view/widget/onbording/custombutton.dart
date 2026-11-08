import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onbording_controller.dart';
import '../../../core/constant/color.dart';

class CustomButtonOnBording extends GetView<OnbordingControllerImp> {
  const CustomButtonOnBording({Key? Key}) : super(key: Key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        padding: EdgeInsets.only(right: 80,left: 80),
        onPressed: () {
          controller.next();
        },
        color: AppColor.primarycolor,
        child: Text("8".tr,style: TextStyle(color: Colors.white),),
      ),
    );
  }}
