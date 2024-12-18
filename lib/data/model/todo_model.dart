import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(3)
  final String time;

  TodoModel({required this.title, required this.time}) : id = const Uuid().v4();
}
