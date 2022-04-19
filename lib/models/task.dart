import 'dart:convert';

class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;


  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.remind,
    this.repeat 
  });



  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id']?.toInt(),
      title: json['title'],
      note: json['note'],
      isCompleted: json['isCompleted']?.toInt(),
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      color: json['color']?.toInt(),
      remind: json['remind']?.toInt(),
      repeat: json['repeat'],
      );
    
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = new Map<String,dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['note'] = this.note;
    data['isCompleted'] = this.isCompleted;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['color'] = this.color;
    data['remind'] = this.remind;
    data['repeat'] = this.repeat;
    return data;
  }



}
