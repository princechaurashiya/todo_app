import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Component/button.dart';
import 'package:todo_app/Component/input_text.dart';
import 'package:todo_app/pages/all_task.dart';
import 'package:todo_app/pages/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late SharedPreferences sp;
  String eml = '';
  String pass = '';
  final signinEmalController = TextEditingController();
  final signinPasswordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    sp = await SharedPreferences.getInstance();
    setState(() {
      eml = sp.getString('email') ?? "No name found";
      pass = sp.getString('pasword') ?? "No name found";
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      // appBar: AppBar(
      //   backgroundColor: Color(0xFFEDEDED),
      // ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 100,
          ),
          const Center(
            child: Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 28),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 240,
            width: 250,
            child: Image.asset('assets/images/teachingMan.png'),
          ),
          SizedBox(
            height: 40,
          ),
          InputText(
              h_text: 'Enter your Email address',
              controllers: signinEmalController),
          SizedBox(
            height: 20,
          ),
          InputText(
              h_text: 'Enter your password',
              controllers: signinPasswordController),
          SizedBox(
            height: 40,
          ),
          Text(
            'Forgot Password ?',
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 108, 76, 212)),
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
              onTap: () {
                if (eml == signinEmalController.text.toString() &&
                    pass == signinPasswordController.text.toString()) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Alltask()));
                }
              },
              child: Button(text: 'Sign In', scree_width: screenWidth * 0.6)),
          SizedBox(
            height: 30,
          ),
          Container(
            width: screenWidth * 1,
            child: Row(
              children: [
                const Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: Text(
                    'Dont have an account ? ',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                    print('Taped Sign in');
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 108, 76, 212)),
                  ),
                )
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
