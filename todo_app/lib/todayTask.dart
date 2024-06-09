import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Component/button.dart';
import 'package:todo_app/homePage.dart';
import 'package:todo_app/todo.dart';

class Todaytask extends StatefulWidget {
  Todaytask({
    super.key,
  });

  @override
  State<Todaytask> createState() => _TodaytaskState();
}

class _TodaytaskState extends State<Todaytask> {
  List<ToDo> tod = List.empty(growable: true);
  List<ToDo> task = [];

  late SharedPreferences sp;
  getSharedPrefrence() async {
    sp = await SharedPreferences.getInstance();

    readFromSp();
  }

  readFromSp() {
    List<String>? taskListString = sp.getStringList('mytask');

    if (taskListString != null) {
      tod = taskListString
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
    double screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      appBar: AppBar(
        title: Text('Hii Prince kumar'),
        backgroundColor: Color.fromARGB(255, 108, 76, 212),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Center(
            child: Container(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/girlwith_walking.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'All task',
              style: TextStyle(
                  color: Color.fromARGB(255, 108, 76, 212), fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: screenHeight * 0.99,
              width: screenWidth * 0.94,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 198, 176, 226),
                  borderRadius: BorderRadius.circular(20)),
              child: ListView.builder(
                  itemCount: tod.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.work),
                        title: Text(tod[index].title.toString()),
                        subtitle: Text(tod[index].description.toString()),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {});
                              //   saveIntoSp();
                            },
                            icon: Icon(Icons.delete)),
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Button(
                    text: 'Add work',
                    scree_width: screenWidth * 0.4,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
