import 'package:ecommerce_p/core/constant/color.dart';
import 'package:ecommerce_p/core/constant/routesname.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../core/localization/changelocal.dart';
import '../widget/language/custombutton.dart';

class MyLang extends GetView<ChangeLocalController> {
  const MyLang({Key? Key}) : super(key: Key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         padding: EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
Text("1".tr,style: TextStyle(
    fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 20,),
            CustomButtonLang(textbutton: 'العربية',onPressed: (){
              controller.changedLang("ar");
              Get.toNamed(AppRoute.onBording);
            },),
            CustomButtonLang(textbutton: 'English',onPressed: (){    controller.changedLang("en");
            Get.toNamed(AppRoute.onBording);},),
          ],
        ),
      ),
    );
  }}