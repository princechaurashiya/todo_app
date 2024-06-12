import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Component/button.dart';
import 'package:todo_app/pages/all_task.dart';
import 'package:todo_app/pages/todo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final titlecontroller = TextEditingController();
  final textcontroller = TextEditingController();
  final datecontroller = TextEditingController();
  late SharedPreferences sp;

  //final todosList = ToDo.todosList();
  List<ToDo> todosList = List.empty(growable: true);
  List<ToDo> to = List.empty(growable: true);
  //List<ToDo> _fountToDo = [];

  getSharedPrefrence() async {
    sp = await SharedPreferences.getInstance();

    readFromSp();
  }

  saveIntoSp() {
    List<String> taskListString =
        todosList.map((task) => jsonEncode(task.toJson())).toList();

    sp.setStringList('mytask', taskListString);

    setState(() {});
  }

  readFromSp() {
    List<String>? taskListString = sp.getStringList('mytask');

    if (taskListString != null) {
      todosList = taskListString
          .map((context) => ToDo.fromJson(json.decode(context)))
          .toList();
    } else {
      print('               empty              ');
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getSharedPrefrence();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 108, 76, 212),
        title: Text("Hii Prince kuamr"),
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                child: Center(child: Image.asset('assets/images/todo.jpeg')),
              ),
            ),
            Center(
                child: Text(
              'Add what you want to do latter on',
              style: TextStyle(
                  color: Color.fromARGB(255, 108, 76, 212), fontSize: 22),
            )),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Container(
              width: screenWidth * 0.3,
              child: TextFormField(
                controller: datecontroller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: " Date",
                ),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Container(
              width: screenWidth * 0.6,
              child: TextFormField(
                controller: titlecontroller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: " Title",
                ),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Container(
              width: screenWidth * 0.8,
              child: TextFormField(
                controller: textcontroller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Description ",
                ),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Center(
                child: InkWell(
              onTap: () {
                String date = datecontroller.text.trim();
                String title = titlecontroller.text.trim();
                String text = textcontroller.text.trim();

                if (date.isNotEmpty & title.isNotEmpty &&
                    text.isNotEmpty &&
                    (0 < int.parse(date) && int.parse(date) <= 31)) {
                  setState(() {
                    datecontroller.text = '';
                    titlecontroller.text = '';
                    textcontroller.text = '';
                    todosList.add(ToDo(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        date: date,
                        title: title,
                        description: text,
                        isDone: true));
                  });
                  saveIntoSp();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Alltask()));
                } else {
                  print('Enter valid ceredential');
                }

                // print('   List   ' + todosList.length.toString());
              },
              child: Button(
                text: 'Add to list',
                scree_width: screenWidth * 0.8,
              ),
            )),
          ],
        ),
      )),
    );
  }

  // void _addToDoItem(String dat, String titl, String descript) {
  //   setState(() {});
  //   datecontroller.clear();
  //   titlecontroller.clear();
  //   textcontroller.clear();
  // }
}
