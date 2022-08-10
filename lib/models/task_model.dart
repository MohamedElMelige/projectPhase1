import 'reminder_model.dart';

class TaskModel {
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final int reminder;
  final int color;
  final int doneTasks;
  final int favourite;
  final int id;


  TaskModel
      ({
    required this.reminder,
    required this.color,
    required this.doneTasks,
    required this.favourite,
    required this.title,
    required this.date,
    required this.id,
    required this.startTime,
    required this.endTime,

  });
  
  factory TaskModel.fromJson(Map<String,dynamic>json){
    return TaskModel(
        reminder:json['reminder']as int,
        color:json['color']as int,
        doneTasks:json['doneTasks']as int,
        favourite:json['favourite']as int,
        id:json['id']as int,
        title: json['title']as String,
        date: json['data']as String,
        startTime: json['startTime']as String,
        endTime: json['endTime']as String);
  }
}

