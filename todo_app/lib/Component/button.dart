import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  double scree_width;
  Button({super.key, required this.text, required this.scree_width});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: scree_width, // Container ki width screen width ka 80% hai
      height: 45,
      color: Color.fromARGB(255, 108, 76, 212),
      child: Center(
        child: Text(
          text, // yahan text ko use karna
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

// class MyResponsiveContainer extends StatelessWidget {
//   final String text;
//   MyResponsiveContainer({required this.text});

//   @override
//   Widget build(BuildContext context) {
//     // MediaQuery se screen size ko access karte hain
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Container(
//       width: screenWidth * 0.8, // Container ki width screen width ka 80% hai
//       height: 45,
//       color: Color.fromARGB(255, 108, 76, 212),
//       child: Center(
//         child: Text(
//           text, // yahan text ko use karna
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
