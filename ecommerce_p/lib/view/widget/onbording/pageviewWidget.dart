import 'package:ecommerce_p/controller/onbording_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/dataSource/static/static.dart';

class CustomPageViewOnBording extends GetView<OnbordingControllerImp> {
  const CustomPageViewOnBording({Key? Key}) : super(key: Key);
  @override
  Widget build(BuildContext context) {

    return PageView.builder(
      controller: controller.pagecontroller,
      onPageChanged: (val){
controller.onPagechanged(val);
    },
      itemCount: onBordingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Text(
            onBordingList[i].title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 80),
          Image.asset(
            onBordingList[i].image!,
            fit: BoxFit.fill,
            width: 250,
            height: 300,
          ),
          SizedBox(height: 80),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBordingList[i].body!,
              style: TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ) ;
  }}
