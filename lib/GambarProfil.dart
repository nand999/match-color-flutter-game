import 'package:flutter/material.dart';

class GambarProfil extends StatelessWidget {
  const GambarProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            child: GestureDetector(
              onTap: () {},
              child: Hero(
                tag: "pp",
                child: ClipRRect(
                 
                  borderRadius: BorderRadius.circular(0),
                  child: Container(
                    height: 350,
                    width: 350, // Mengatur lebar agar gambar menjadi lingkaran
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/logo.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
