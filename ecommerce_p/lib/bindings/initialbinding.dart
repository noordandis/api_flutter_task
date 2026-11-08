
import 'package:get/get.dart';

import '../core/class/curd.dart';

class initialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud()) ;
  }
}