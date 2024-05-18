import 'package:coba_dragable/AboutMe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class TebakAngka extends StatefulWidget {
  const TebakAngka({super.key});

  @override
  State<TebakAngka> createState() => _TebakAngkaState();
}

class _TebakAngkaState extends State<TebakAngka> {
  int randomNumber = Random().nextInt(10) + 1;
  int correctAnswerIndex = Random().nextInt(3);

  @override
  Widget build(BuildContext context) {
    List<int> options = List<int>.generate(3, (index) {
      if (index == correctAnswerIndex) {
        return randomNumber;
      } else {
        int wrongNumber;
        do {
          wrongNumber = Random().nextInt(10) + 1;
        } while (wrongNumber == randomNumber);
        return wrongNumber;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tebak Angka",
          style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(
          Icons.abc,
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutMe()),
                );
              }),
          IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                SystemNavigator.pop();
              })
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.cyan],
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.topLeft)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the images in a Wrap widget
            Wrap(
              spacing: 8.0, // spacing between images
              runSpacing: 8.0, // spacing between lines
              children: List.generate(randomNumber, (index) {
                return Image.asset('assets/duck.png', width: 50, height: 50);
              }),
            ),
            const SizedBox(height: 20),
            // Display the options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: options.map((option) {
                return GestureDetector(
                  onTap: () {
                    String message;
                    if (option == randomNumber) {
                      message = "Tebakan Anda benar!";
                    } else {
                      message = "Tebakan Anda salah!";
                    }
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Text(
                          message,
                          style: TextStyle(
                            color: option == randomNumber
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 5,
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                randomNumber = Random().nextInt(10) + 1;
                                correctAnswerIndex = Random().nextInt(3);
                              });
                            },
                            child: const Text(
                              "Coba Lagi",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        option.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
