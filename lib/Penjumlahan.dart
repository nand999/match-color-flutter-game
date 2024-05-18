import 'package:coba_dragable/AboutMe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class Penjumlahan extends StatefulWidget {
  const Penjumlahan({super.key});

  @override
  State<Penjumlahan> createState() => _PenjumlahanState();
}

class _PenjumlahanState extends State<Penjumlahan> {
  int num1 = Random().nextInt(10);
  int num2 = Random().nextInt(10);
  int correctAnswer = 0;
  TextEditingController answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    correctAnswer = num1 + num2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tebak Penjumlahan",
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
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              SystemNavigator.pop();
            },
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.cyan],
              begin: FractionalOffset.topRight,
              end: FractionalOffset.topLeft,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$num1 + $num2 = ?',
              style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),


              // widget textfield sebagai tempat inputan 

              
              child: TextField(
                controller: answerController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Jawaban',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.cyan)),
              onPressed: () {
                int userAnswer = int.tryParse(answerController.text) ?? 0;
                String message;
                if (userAnswer == correctAnswer) {
                  message = "Jawaban Anda benar!";
                } else {
                  message = "Jawaban Anda salah!";
                }
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(message),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            num1 = Random().nextInt(10);
                            num2 = Random().nextInt(10);
                            correctAnswer = num1 + num2;
                            answerController.clear();
                          });
                        },
                        child: const Text("Coba Lagi"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Submit", style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}
