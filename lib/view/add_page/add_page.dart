import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/view/add_page/widgets/custom_button.dart';
import 'package:todo_project/view/add_page/widgets/todo_date.dart';
import '../../controller/add/add_controller.dart';
import 'widgets/custom_text_field.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddController>(
      init: AddController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          body: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              const Text("Create todo", style: TextStyle(fontSize: 19)),
              const SizedBox(height: 20),
              CustomTextField(controller: controller.titleController),
              const SizedBox(height: 20),
              const Text("Select Date", style: TextStyle(fontSize: 19)),
              const SizedBox(height: 14),
              DatePickerCustom(controller: controller),
              const SizedBox(height: 100),
              const CustomButton(),
            ],
          )
        );
      },
    );
  }
}