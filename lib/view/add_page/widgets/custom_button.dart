import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/add/add_controller.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.sizeOf(context).width - 40,
        height: 50,
        decoration: BoxDecoration(
            color: const Color(0xffAA98A9),
            borderRadius: BorderRadius.circular(10)),
        child: const Center(
            child: Text(
                "Save", 
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))),
      ),
      onTap: () async {
        await Get.find<AddController>().createTodo();

      },
    );
  }
}
