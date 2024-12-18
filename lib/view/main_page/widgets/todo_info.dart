import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controller/add/add_controller.dart';
import 'package:todo_project/data/model/todo_model.dart';

class TodoInfo extends StatelessWidget {
  final TodoModel todo;
  const TodoInfo({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width - 40,
        height: 90,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black54)),
        child:  Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todo.title,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black)),
                  Text(todo.time.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black)),

                ],
              ),
              IconButton(onPressed: (){
                Get.find<AddController>().deleteTodoById(todo.id);
              }, icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}
