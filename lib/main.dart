import 'package:coba_dragable/SplashScreen.dart';
// import 'package:coba_dragable/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BELAJAR WARNA',
      home: SplashScreen(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'BELAJAR WARNA',
//       home: SplashScreenWrapper(),
//     );
//   }
// }

// class SplashScreenWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen(
//       onSplashScreenComplete: () {
//         Future.delayed(Duration(seconds: 3), () {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => ColorLearning()),
//           );
//         });
//       },
//     );
//   }
// }
