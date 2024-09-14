// import 'package:flutter/foundation.dart';

// class ToDo {
//   String? id;
//   String date;
//   String? title;
//   String? description;
//   bool isDone;
//   ToDo({
//     required this.id,
//     required this.date,
//     required this.title,
//     required this.description,
//     this.isDone = false,
//   });

//   static List<ToDo> todoList() {
//     return [
//       ToDo(
//           id: '01',
//           date: 'jun 1',
//           title: 'Work out',
//           description: 'Morning Exercise',
//           isDone: true),
//       ToDo(
//           id: '02',
//           date: 'jun 9',
//           title: 'Shoping ',
//           description: 'buy groceries ',
//           isDone: true),
//       ToDo(
//           id: '03',
//           date: 'june 10',
//           title: 'Meeting',
//           description: 'with team mate ',
//           isDone: true),
//     ];
//   }
// }

class ToDo {
  String id;
  String date;
  String? title;
  String? description;
  bool isDone;

  ToDo({
    required this.id,
    required this.date,
    this.title,
    this.description,
    required this.isDone,
  });

  // Factory constructor to create a ToDo from JSON
  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'],
      date: json['date'],
      title: json['title'],
      description: json['description'],
      isDone: json['isDone'] == 'true',
    );
  }

  // Method to convert ToDo instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'title': title,
      'description': description,
      'isDone': isDone.toString(),
    };
  }
}

//This is also for checking
