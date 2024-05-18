import 'package:animate_do/animate_do.dart';
import 'package:coba_dragable/AboutMe.dart';
import 'package:coba_dragable/ColorLearningBaru.dart';
import 'package:coba_dragable/Penjumlahan.dart';
import 'package:coba_dragable/Quiz.dart';
import 'package:coba_dragable/TebakAngka.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Aplikasi Edukasi",
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(
          Icons.abc,
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutMe()),
                );
              }),
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                SystemNavigator.pop();
              })
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.cyan],
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.topLeft)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/bg.jpg',
                ),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(children: [
            SizedBox(height: 30),

            //widget fadinup merupakan widget animasi yang menampilkan animasi pergerakan dari bawah ke atas

            FadeInUp(
              duration: Duration(milliseconds: 1900),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TebakAngka()),
                    );
                  },
                  splashColor: Colors.grey,
                  hoverColor: Colors.grey,
                  child: Ink(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.cyanAccent,
                          Colors.cyanAccent,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Tebak Angka",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            FadeInUp(
              duration: Duration(milliseconds: 1900),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ColorLearningBaru()),
                    );
                  },
                  splashColor: Colors.grey,
                  hoverColor: Colors.grey,
                  child: Ink(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.cyanAccent,
                          Colors.cyanAccent,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Mencocokan Warna",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            FadeInUp(
              duration: Duration(milliseconds: 1900),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Penjumlahan()),
                    );
                  },
                  splashColor: Colors.grey,
                  hoverColor: Colors.grey,
                  child: Ink(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.cyanAccent,
                          Colors.cyanAccent,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Belajar Penjumlahan",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            FadeInUp(
              duration: Duration(milliseconds: 1900),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizScreen()),
                    );
                  },
                  splashColor: Colors.grey,
                  hoverColor: Colors.grey,
                  child: Ink(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.cyanAccent,
                          Colors.cyanAccent,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Quiz",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
