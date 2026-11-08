import 'dart:ui';

import 'package:ecommerce_p/core/services/services.dart';
import 'package:get/get.dart';

class ChangeLocalController extends GetxController{
  Locale? language ;
  MyServices myServices=Get.find();
  changedLang(String codelang){
    Locale? locale=Locale(codelang);
    myServices.sharedpreferences.setString("lang",codelang);
    Get.updateLocale(locale);

  }
  @override
  void onInit() {
 String? sharedPrefLang=myServices.sharedpreferences.getString("lang");
 if(sharedPrefLang=="ar")
   {
     language=Locale("ar");
   }else if(sharedPrefLang=="en")
     {
       language=Locale("en");
     }else
       {
         language=Locale(Get.deviceLocale!.languageCode);
       }
    super.onInit();
  }
}