import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../data/model/todo_model.dart';

class MainController extends GetxController {

  List<TodoModel> todoList = [];
  @override
  Future<void> onInit() async {
    super.onInit();
    final box = Hive.box<TodoModel>('todoBox');
    todoList = box.values.toList();
  }

  Future<void> onRefresh() async {
    Future.delayed(const Duration(seconds: 1));
    onInit();
    update();
  }

}
