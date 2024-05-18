import 'package:coba_dragable/Menu.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});



  double small(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double big(BuildContext context) => MediaQuery.of(context).size.width * 7 / 8;

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Menu()),
      );
    });
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            right: -small(context) / 3,
            top: -small(context) / 3,
            child: Container(
                width: small(context),
                height: small(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [Colors.deepOrange, Colors.cyan],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter))),
          ),
          Positioned(
            left: -small(context) / 4,
            top: -small(context) / 4,
            child: Container(
                width: big(context),
                height: big(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [Colors.deepOrange, Colors.cyan],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter))),
          ),
          Positioned(
            right: -big(context) / 4,
            bottom: -big(context) / 4,
            child: Container(
                width: small(context),
                height: small(context),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [Colors.cyan, Colors.deepOrange],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter))),
          ),

          // widget center untuk meletakkan child widget ditengah

          Center(

            // widget column untuk menyusun widget children kebawah

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Aplikasi",
                  style: TextStyle(
                      color: Colors.black, fontSize: 55, fontFamily: "Lobster"),
                ),
                Text(
                  "        Edukasi",
                  style: TextStyle(
                      color: Colors.black, fontSize: 55, fontFamily: "Lobster"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
