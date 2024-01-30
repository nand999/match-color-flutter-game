import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAccepted = false;

  Color? targetColor;
  Color ori = Colors.black26.withOpacity(0.7);

  Color colorBlue = Colors.blue;
  Color colorRed = Colors.red;
  Color colorYellow = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BELAJAR WARNA"),
        ),
        body: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //DRAGGABLE BLUE

              Draggable<Color>(
                data: colorBlue,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: colorBlue,
                    shape: StadiumBorder(),
                  ),
                ),
                childWhenDragging: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: ori,
                    shape: StadiumBorder(),
                  ),
                ),
                feedback: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: colorBlue.withOpacity(0.8),
                    shape: StadiumBorder(),
                  ),
                ),
              ),

              //DRAGGABLE RED

              Draggable<Color>(
                data: colorRed,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: colorRed,
                    shape: StadiumBorder(),
                  ),
                ),
                childWhenDragging: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: ori,
                    shape: StadiumBorder(),
                  ),
                ),
                feedback: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: colorRed.withOpacity(0.8),
                    shape: StadiumBorder(),
                  ),
                ),
              ),

              //DRAGGABLE YELLOW

              Draggable<Color>(
                data: colorYellow,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: colorYellow,
                    shape: StadiumBorder(),
                  ),
                ),
                childWhenDragging: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: ori,
                    shape: StadiumBorder(),
                  ),
                ),
                feedback: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: colorYellow.withOpacity(0.8),
                    shape: StadiumBorder(),
                  ),
                ),
              )
            ],
          ),
          DragTarget<Color>(
            onWillAccept: (value) => true,
            onAccept: (value) {
              isAccepted = true;
              targetColor = value;
              showColorDialog(value);
            },
            builder: (context, candidateData, rejectedData) => (isAccepted)
                ? SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      color: targetColor,
                      shape: StadiumBorder(),
                    ),
                  )
                : SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      color: ori,
                      shape: StadiumBorder(),
                    ),
                  ),
          )
        ]),
      ),
    );
  }

   void showColorDialog(Color? color) {
    String colorName = getColorName(color);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warna yang Anda tunjuk:'),
          content: Text(colorName),
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

  String getColorName(Color? color) {
    if (color == colorBlue) {
      return 'Biru';
    } else if (color == colorRed) {
      return 'Merah';
    } else if (color == colorYellow) {
      return 'Kuning';
    } else {
      return 'Warna Tidak Dikenal';
    }
  }

}


