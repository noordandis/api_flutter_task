import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

import '../../../controller/onbording_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/dataSource/static/static.dart';

class DotControllerOnBording extends StatelessWidget {
  const DotControllerOnBording({Key? Key}) : super(key: Key);
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OnbordingControllerImp>(builder: (controller)=>Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          onBordingList.length,
              (index) => AnimatedContainer(
            margin: EdgeInsets.only(right: 5),
            duration: Duration(milliseconds: 900),
            width: controller.currentPage==index? 20:5,
            height: 6,
            decoration: BoxDecoration(
              color: AppColor.primarycolor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    ));
  }}
