import 'package:coba_dragable/AboutMe.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class ColorLearningBaru extends StatefulWidget {
  const ColorLearningBaru({Key? key}) : super(key: key);

  @override
  _ColorLearningBaruState createState() => _ColorLearningBaruState();
}

class _ColorLearningBaruState extends State<ColorLearningBaru> {
  final AudioPlayer audioPlayer = AudioPlayer();
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
      // Colors.white,
      Colors.brown,
      Colors.purple,
      Colors.teal,
    ];
    generateRandomColors();
  }

  void generateRandomColors() {
    final _random = Random();

    // Generate tiga indeks acak yang berbeda
    int index1 = _random.nextInt(availableColors.length);
    int index2;
    do {
      index2 = _random.nextInt(availableColors.length);
    } while (index2 == index1);

    int index3;
    do {
      index3 = _random.nextInt(availableColors.length);
    } while (index3 == index1 || index3 == index2);

    // Tentukan warna untuk masing-masing indeks
    color1 = availableColors[index1];
    color2 = availableColors[index2];
    color3 = availableColors[index3];

    // Set targetColor menjadi salah satu dari tiga warna secara acak
    targetColor = [color1, color2, color3][_random.nextInt(3)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mencocokkan Warna",
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
      body: Column(
        children: <Widget>[

          //widget container digunakan sebagai wadah wiget child didalamnya


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
                    // targetColor = value;
                  });
                  // showColorDialogBenar(value);

                  // Periksa apakah warna yang ditunjukkan sesuai dengan targetColor
                  if (value == targetColor) {
                    // Jika sesuai, tampilkan pesan bahwa warna benar
                    showColorDialogBenar(value);
                    generateRandomColors();
                  } else {
                    // Jika tidak sesuai, tampilkan pesan bahwa warna salah
                    showResultDialog(
                        'Warna yang Anda pilih tidak sesuai dengan target.');
                  }
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


          // widget elevated button merupakan widget tombol


          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.cyan)),
            onPressed: () {
              setState(() {
                generateRandomColors();
                // targetColor = null;
              });
            },
            child: Text('Refresh Warna', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  void showColorDialogBenar(Color color) {
    String colorName = getColorName(color);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          // widget text untuk menampilkan teks

          title: Text(
            'Benar! warna yang ditampilkan:',
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

  void showResultDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Salah!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: TextStyle(fontSize: 18),
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
}
