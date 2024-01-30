import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BELAJAR WARNA',
      home: ColorLearning(),
    );
  }
}

class ColorLearning extends StatefulWidget {
  const ColorLearning({Key? key}) : super(key: key);

  @override
  _ColorLearningState createState() => _ColorLearningState();
}

class _ColorLearningState extends State<ColorLearning> {
  bool isAccepted = false;

  Color? targetColor;
  Color ori = Colors.black26.withOpacity(0.7);

  Color colorBlue = Colors.blue;
  Color colorRed = Colors.red;
  Color colorYellow = Colors.yellow;
  Color colorGreen = Colors.green;
  Color colorCyan = Colors.cyan;
  Color colorPink = Colors.pink;
  Color colorOrange = Colors.orange;
  Color colorBlack = Colors.black;
  Color colorWhite = Colors.white;
  Color colorBrown = Colors.brown;
  Color colorPurple = Colors.purple;
  Color colorTeal= Colors.teal;

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
                  width: 70,
                  height: 70,
                  child: Material(
                    color: colorBlue,
                    shape: StadiumBorder(),
                  ),
                ),
                childWhenDragging: SizedBox(
                  width: 70,
                  height: 70,
                  child: Material(
                    color: ori,
                    shape: StadiumBorder(),
                  ),
                ),
                feedback: SizedBox(
                  width: 70,
                  height: 70,
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
                  width: 70,
                  height: 70,
                  child: Material(
                    color: colorRed,
                    shape: StadiumBorder(),
                  ),
                ),
                childWhenDragging: SizedBox(
                  width: 70,
                  height: 70,
                  child: Material(
                    color: ori,
                    shape: StadiumBorder(),
                  ),
                ),
                feedback: SizedBox(
                  width: 70,
                  height: 70,
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
                  width: 70,
                  height: 70,
                  child: Material(
                    color: colorYellow,
                    shape: StadiumBorder(),
                  ),
                ),
                childWhenDragging: SizedBox(
                  width: 70,
                  height: 70,
                  child: Material(
                    color: ori,
                    shape: StadiumBorder(),
                  ),
                ),
                feedback: SizedBox(
                  width: 70,
                  height: 70,
                  child: Material(
                    color: colorYellow.withOpacity(0.8),
                    shape: StadiumBorder(),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Center(
              child: DragTarget<Color>(
                onWillAccept: (value) => true,
                onAccept: (value) {
                  isAccepted = true;
                  targetColor = value;
                  showColorDialog(value);
                },
                builder: (context, candidateData, rejectedData) => (isAccepted)
                    ? SizedBox(
                        width: 300,
                        height: 300,
                        child: Material(
                          color: targetColor,
                          shape: StadiumBorder(),
                        ),
                      )
                    : SizedBox(
                        width: 300,
                        height: 300,
                        child: Material(
                          color: ori,
                          shape: StadiumBorder(),
                        ),
                      ),
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


