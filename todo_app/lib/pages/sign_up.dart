import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Component/button.dart';
import 'package:todo_app/Component/input_text.dart';
import 'package:todo_app/pages/all_task.dart';
import 'package:todo_app/pages/sign_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late SharedPreferences sp;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final paswordController = TextEditingController();
  final cnfPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPreferences();
  }

  void initSharedPreferences() async {
    sp = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    double Screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      // appBar: AppBar(
      //   backgroundColor: Color(0xFFEDEDED),
      // ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            const Text(
              'Welcome Onboard!',
              style: TextStyle(fontSize: 33),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
                child: Text(
              "Let's help you meet up your task",
              style: TextStyle(
                  color: Color.fromARGB(255, 108, 76, 212), fontSize: 18),
            )),
            const SizedBox(
              height: 70,
            ),
            InputText(
              controllers: nameController,
              h_text: 'Enter your Full Name',
            ),
            const SizedBox(
              height: 20,
            ),
            InputText(
              controllers: emailController,
              h_text: 'Enter your Email',
            ),
            const SizedBox(
              height: 20,
            ),
            InputText(
                controllers: paswordController, h_text: 'Create a password'),
            const SizedBox(
              height: 20,
            ),
            InputText(
                controllers: cnfPasswordController,
                h_text: 'Confirm your password'),
            const SizedBox(
              height: 80,
            ),
            InkWell(
                onTap: () async {
                  String nam = nameController.text;
                  String eml = emailController.text;
                  String pass = paswordController.text;
                  String cnfpass = cnfPasswordController.text;
                  if (nam.isNotEmpty &&
                      eml.isNotEmpty &&
                      pass.isNotEmpty &&
                      cnfpass.isNotEmpty) {
                    if (pass == cnfpass) {
                      await sp.setString('name', nam);
                      await sp.setString('email', eml);
                      await sp.setString('password', pass);
                      sp.setBool('islogin', true);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Alltask()));
                    } else {
                      print("Password not match" + nam.toString());
                    }
                  } else {
                    print(eml.toString() + "hello    ");
                  }
                },
                child: Button(text: 'Sign Up', scree_width: Screenwidth * 0.6)),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: Screenwidth * 1,
              child: Row(
                children: [
                  const Padding(
                    padding: const EdgeInsets.only(left: 45.0),
                    child: Text(
                      'Already have an account ? ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                      print('Taped Sign in');
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 108, 76, 212)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
