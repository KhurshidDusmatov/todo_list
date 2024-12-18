import 'package:get/get.dart';
import 'package:todo_project/controller/add/add_controller.dart';
import 'controller/main/main_controller.dart';

class DIService {
  static Future<void> init() async {
    /// controllers
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<AddController>(() => AddController(), fenix: true);
  }
}



