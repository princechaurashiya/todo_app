import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/pages/homePage.dart';
import 'package:todo_app/pages/todo.dart';

class Alltask extends StatefulWidget {
  Alltask({
    super.key,
  });

  @override
  State<Alltask> createState() => _AlltaskState();
}

class _AlltaskState extends State<Alltask> {
  // List<ToDo> tod = List.empty(growable: true);
  late SharedPreferences sp;
  List<ToDo> tod = [];

  String name = '';

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getSharedPrefrence();
    loadName();
  }

  Future<void> getSharedPrefrence() async {
    sp = await SharedPreferences.getInstance();

    readFromSp();
  }

// For retrive data from SharedPreference
  void readFromSp() {
    List<String>? taskListString = sp.getStringList('mytask');
    if (taskListString != null) {
      setState(() {
        tod = taskListString
            .map((context) => ToDo.fromJson(json.decode(context)))
            .toList();
      });
    } else {
      print('               empty              ');
    }
  }

// For deleting task and after that save remaining data in  shared preference
  Future<void> removeFromSp(int index) async {
    setState(() {
      tod.removeAt(index);
    });
    List<String> taskListString =
        tod.map((item) => json.encode(item.toJson())).toList();
    await sp.setStringList('mytask', taskListString);
  }

  //For retriving normal sign up page data
  void loadName() async {
    sp = await SharedPreferences.getInstance();
    setState(() {
      name = sp.getString('name') ?? "No name found"; // Retrieving name
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 108, 76, 212),
        title: Text('Hii ' + name.toString()),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
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
              height: 180,
              width: 200,
              child: Image.asset('assets/images/girlwith_walking.png'),
            ),
          ),
          const Padding(
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
          Stack(
            children: [
              Center(
                child: Container(
                  height: screenHeight * 1.188,
                  width: screenWidth * 0.94,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 198, 176, 226),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView.builder(
                      itemCount: tod.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  tod[index].date.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  DateFormat('MMMM')
                                      .format(DateTime.now())
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            title: Text(
                              tod[index].title.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                            subtitle: Text(
                              tod[index].description.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  removeFromSp(index);
                                },
                                icon: Icon(Icons.delete)),
                          ),
                        );
                      }),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 20,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 15.0, right: 12),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       InkWell(
          //         onTap: () {},
          //         child: Button(
          //           text: 'Add work',
          //           scree_width: screenWidth * 0.4,
          //         ),
          //       ),

          //     ],
          //   ),
          // ),
        ],
      )),
    );
  }
}
