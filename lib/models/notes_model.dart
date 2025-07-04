import 'package:hive/hive.dart';

part 'notes_model.g.dart';
@HiveType(typeId: 0)
class NotesModel extends HiveObject{
  @HiveField(0)
   String title;
  @HiveField(1)
   String content;
  @HiveField(2)
  final String date;
  @HiveField(3)
   int color;

  NotesModel({
    required this.color,
    required this.title,
    required this.content,
    required this.date,
  });
}
