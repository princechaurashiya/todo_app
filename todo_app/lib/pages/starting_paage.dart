import 'package:flutter/material.dart';
import 'package:todo_app/Component/button.dart';
import 'package:todo_app/pages/sign_up.dart';

class StartingPaage extends StatelessWidget {
  const StartingPaage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset('assets/images/sitingman.png'),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              'Get thins done with TODO',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
                '     Lorem ipsum dolor sit amet,\nconsectetur adipisicing. Maxime,\ntempore! Animi nemo out atque,\ndeleniti nihil dolorem repellendus.'),
          ),
          SizedBox(
            height: 80,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Button(
                text: 'Get Started',
                scree_width: screenWidth * 0.8,
              ),
            ),
          )
        ],
      )),
    );
  }
}
