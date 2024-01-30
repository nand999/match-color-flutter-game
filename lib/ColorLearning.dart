import 'package:coba_dragable/AboutMe.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

class ColorLearning extends StatefulWidget {
  const ColorLearning({Key? key}) : super(key: key);

  @override
  _ColorLearningState createState() => _ColorLearningState();
}

class _ColorLearningState extends State<ColorLearning> {
  late List<Color> availableColors;
  Color? color1;
  Color? color2;
  Color? color3;
  Color? targetColor;

  @override
  void initState() {
    super.initState();
    availableColors = [
      Colors.blue,
      Colors.red,
      Colors.yellow,
      Colors.green,
      Colors.cyan,
      Colors.pink,
      Colors.orange,
      Colors.black,
      Colors.white,
      Colors.brown,
      Colors.purple,
      Colors.teal,
    ];
    generateRandomColors();
  }

  void generateRandomColors() {
    final _random = Random();
    color1 = availableColors[_random.nextInt(availableColors.length)];
    color2 = availableColors[_random.nextInt(availableColors.length)];
    color3 = availableColors[_random.nextInt(availableColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BELAJAR WARNA",
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(
          Icons.adb,
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AboutMe()),
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
                  colors: [Colors.deepOrange, Colors.cyan],
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.topLeft)),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Dragabble Widgets for Colors
                Draggable<Color>(
                  data: color1,
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Material(
                      color: color1,
                      shape: StadiumBorder(),
                    ),
                  ),
                  feedback: SizedBox(
                    width: 70,
                    height: 70,
                    child: Material(
                      color: color1?.withOpacity(0.8),
                      shape: StadiumBorder(),
                    ),
                  ),
                  childWhenDragging: SizedBox(
                    width: 70,
                    height: 70,
                    child: Material(
                      color: Colors.transparent,
                      shape: StadiumBorder(),
                    ),
                  ),
                ),
                Draggable<Color>(
                  data: color2,
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Material(
                      color: color2,
                      shape: StadiumBorder(),
                    ),
                  ),
                  feedback: SizedBox(
                    width: 70,
                    height: 70,
                    child: Material(
                      color: color2?.withOpacity(0.8),
                      shape: StadiumBorder(),
                    ),
                  ),
                  childWhenDragging: SizedBox(
                    width: 70,
                    height: 70,
                    child: Material(
                      color: Colors.transparent,
                      shape: StadiumBorder(),
                    ),
                  ),
                ),
                Draggable<Color>(
                  data: color3,
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Material(
                      color: color3,
                      shape: StadiumBorder(),
                    ),
                  ),
                  feedback: SizedBox(
                    width: 70,
                    height: 70,
                    child: Material(
                      color: color3?.withOpacity(0.8),
                      shape: StadiumBorder(),
                    ),
                  ),
                  childWhenDragging: SizedBox(
                    width: 70,
                    height: 70,
                    child: Material(
                      color: Colors.transparent,
                      shape: StadiumBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: DragTarget<Color>(
                onWillAccept: (value) => true,
                onAccept: (value) {
                  setState(() {
                    targetColor = value;
                  });
                  showColorDialog(value);
                },
                builder: (context, candidateData, rejectedData) {
                  return SizedBox(
                    width: 300,
                    height: 300,
                    child: Material(
                      color: targetColor ?? Colors.black26.withOpacity(0.7),
                      shape: StadiumBorder(),
                    ),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.black)),
            onPressed: () {
              setState(() {
                generateRandomColors();
                targetColor = null;
              });
            },
            child: Text('Refresh Warna', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void showColorDialog(Color color) {
    String colorName = getColorName(color);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Warna yang Anda tunjuk:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                colorName,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  String getColorName(Color color) {
    if (targetColor == Colors.blue) {
      return 'Biru';
    } else if (targetColor == Colors.red) {
      return 'Merah';
    } else if (targetColor == Colors.cyan) {
      return 'Cyan';
    } else if (targetColor == Colors.yellow) {
      return 'Kuning';
    } else if (targetColor == Colors.teal) {
      return 'Teal';
    } else if (targetColor == Colors.brown) {
      return 'Brown';
    } else if (targetColor == Colors.black) {
      return 'Black';
    } else if (targetColor == Colors.white) {
      return 'White';
    } else if (targetColor == Colors.orange) {
      return 'Orange';
    } else if (targetColor == Colors.pink) {
      return 'Pink';
    } else if (targetColor == Colors.green) {
      return 'Green';
    } else if (targetColor == Colors.purple) {
      return 'Purple';
    } else if (targetColor == Colors.blue) {
      return 'Blue';
    } else {
      return targetColor.toString();
    }
  }
}
