import 'package:ecommerce_p/core/constant/color.dart';
import 'package:ecommerce_p/data/dataSource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../controller/onbording_controller.dart';
import '../widget/onbording/custombutton.dart';
import '../widget/onbording/dotcontroller.dart';
import '../widget/onbording/pageviewWidget.dart';

class OnBording extends StatelessWidget {
  const OnBording({Key? Key}) : super(key: Key);
  @override
  Widget build(BuildContext context) {
    Get.put(OnbordingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded (
              flex: 3,
              child: CustomPageViewOnBording(),
            ),
            Expanded(
              child: Column(
                children:const [
                  DotControllerOnBording(),
                  SizedBox(height: 80),
                  CustomButtonOnBording(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
