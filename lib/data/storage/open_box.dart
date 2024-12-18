import 'package:hive/hive.dart';

import '../model/todo_model.dart';

Future<void> openTodoBox() async {
  await Hive.openBox<TodoModel>('todoBox');
}