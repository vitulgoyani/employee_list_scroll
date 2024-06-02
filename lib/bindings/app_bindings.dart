import 'package:get/get.dart';

import '../controller/home_controller.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
