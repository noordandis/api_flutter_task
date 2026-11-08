import 'package:ecommerce_p/core/localization/translation.dart';
import 'package:ecommerce_p/core/services/services.dart';
import 'package:ecommerce_p/view/screen/lang.dart';
import 'package:ecommerce_p/view/screen/onbording.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/initialbinding.dart';
import 'core/localization/changelocal.dart';
import 'routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ChangeLocalController controller= Get.put(ChangeLocalController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      initialBinding:initialBindings() ,
      getPages: routes,
    );
  }
}


