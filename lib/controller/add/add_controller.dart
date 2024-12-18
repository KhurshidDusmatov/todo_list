import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_project/controller/main/main_controller.dart';
import 'package:todo_project/data/model/todo_model.dart';
import 'package:todo_project/data/service/local_notification_service.dart';

class AddController extends GetxController {
  TextEditingController titleController = TextEditingController();
  String time = '';

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  Future<void> createTodo() async {
    if (titleController.text.isEmpty) {
      Get.snackbar("Todo", "Please enter your todo");
      return;
    }
    if (time.isEmpty) {
      Get.snackbar("Todo", "Please select the time");
      return;
    }
    DateTime dateTime = DateTime.parse(time);
    if (dateTime.isBefore(DateTime.now()) || dateTime == DateTime.now()) {
      Get.snackbar("Todo", 'Selected time is not valid');
      return;
    }

    TodoModel todo =
        TodoModel(title: titleController.text, time: dateTime.toString());

    await Hive.box<TodoModel>('todoBox').add(todo);
    Get.find<MainController>().onRefresh();
    Get.log("Notification  ----- ${todo.title} $dateTime");
    LocalNotificationService().scheduleNotification(
        title: "${dateTime.hour}:${dateTime.minute}",
        body: todo.title,
        schedule: dateTime);
    titleController.clear();
    time = '';
    Get.back();
  }

  Future<void> deleteTodoById(String id) async {
    final box = Hive.box<TodoModel>('todoBox');
    final todoToDelete = box.values.firstWhere((todo) => todo.id == id);
    await todoToDelete.delete();
    await Get.find<MainController>().onRefresh();
  }
}
