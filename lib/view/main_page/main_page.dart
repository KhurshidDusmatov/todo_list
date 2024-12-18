import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/data/service/local_notification_service.dart';
import 'package:todo_project/view/add_page/add_page.dart';
import 'package:todo_project/view/main_page/widgets/todo_info.dart';
import '../../controller/main/main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Todo List"),
            actions: [
              IconButton(
                  onPressed: () {
                    print("Callll ");
                    LocalNotificationService().testNot();
                  }, icon: const Icon(Icons.notifications))
            ],
          ),
          body: Column(
            children: [
              controller.todoList.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: controller.todoList.length,
                        itemBuilder: (context, index) {
                          return TodoInfo(todo: controller.todoList[index]);
                        },
                      ),
                    )
                  : const Expanded(child: Center(child: Text("No data"))),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(() => const AddPage(),
                    transition: Transition.rightToLeft);
              },
              child: const Icon(CupertinoIcons.plus)),
        );
      },
    );
  }
}
