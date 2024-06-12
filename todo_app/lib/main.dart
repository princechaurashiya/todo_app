import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/pages/all_task.dart';
import 'package:todo_app/pages/starting_paage.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  late SharedPreferences sp;
  bool isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    sp = await SharedPreferences.getInstance();
    bool? loginStatus = sp.getBool('islogin');
    setState(() {
      isLogin = loginStatus ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: isLogin ? Alltask() : StartingPaage(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:todo_app/pages/all_task.dart';
// import 'package:todo_app/pages/starting_paage.dart';

// void main() {
//   runApp(Myapp());
// }

// class Myapp extends StatefulWidget {
//   const Myapp({super.key});

//   @override
//   State<Myapp> createState() => _MyappState();
// }

// class _MyappState extends State<Myapp> {
//   late SharedPreferences sp;
//   bool isLogin = false; // Initialize with a default value

//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   void loadData() async {
//     sp = await SharedPreferences.getInstance();
//     bool? loginStatus = sp.getBool('islogin');
//     setState(() {
//       isLogin = loginStatus ?? false; // Use ?? to handle null value
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter app',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.purple),
//       home: isLogin ? Alltask() : StartingPaage(),
//     );
//   }
// }
