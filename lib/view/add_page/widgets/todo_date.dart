import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:todo_project/controller/add/add_controller.dart';

class DatePickerCustom extends StatelessWidget {
  final AddController controller;

  const DatePickerCustom({super.key, required this.controller});

  void _showDatePicker(BuildContext context) {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2024, 1, 1),
      maxTime: DateTime(2030, 12, 31),
      onConfirm: (date) {
        controller.time = date.toString();
        controller.update();
      },
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Center(
        child: InkWell(
          child: Container(
            width: MediaQuery.sizeOf(context).width - 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 12, left: 12, top: 10, bottom: 10),
              child: Center(
                child: Text(
                  controller.time.isEmpty
                      ? "Not selected yet"
                      : controller.time,
                  style: const TextStyle(
                    color: Colors.black54,
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          onTap: () {
            _showDatePicker(context);
            controller.update();
          },
        ),
      ),
    );
  }
}
