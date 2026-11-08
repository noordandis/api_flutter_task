import 'package:ecommerce_p/core/constant/routesname.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';
import '../data/dataSource/static/static.dart';

abstract class OnbordingController extends GetxController {
  next();
  onPagechanged(int index);
}

class OnbordingControllerImp extends OnbordingController {
   late PageController pagecontroller;
   MyServices myServices=Get.find();
  int currentPage = 0;
  @override
  next() async {
    currentPage++;
    if(currentPage>onBordingList.length-1){
      myServices.sharedpreferences.setString("onboarding", "1") ;
      Get.offAllNamed(AppRoute.login);
    }else{  pagecontroller.animateToPage(
      currentPage,
      duration: Duration(milliseconds: 900),
      curve: Curves.easeInOut,
    );}

  }

  @override
  onPagechanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }
}
