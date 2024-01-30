import 'package:coba_dragable/GambarProfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

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
          IconButton(icon: Icon(Icons.info), onPressed: () {}),
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
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepOrange, Colors.cyan],
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.topLeft)),
        ),
        Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return GambarProfil();
                              }));
                            },
                            child: Hero(
                              tag: "pp",
                              child: ClipRRect(
                                
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.25,
                                  width: MediaQuery.of(context).size.height *
                                      0.25, // Mengatur lebar agar gambar menjadi lingkaran
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
                      Center(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 20,
                                bottom: 10
                              ),
                              child: Text("Developed By:"),
                            ),
                            Text("Ananda Dwi Ariano",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                            Text("Mahasiswa Politeknik negeri jember jurusan teknologi informasi angkatan 2022", textAlign: TextAlign.center,),
                            Container(
                              margin: EdgeInsets.only(
                                top: 15
                              ),
                              child: Text("Dibuat 2024", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),))
                          ],
                        ),
                      )
                    ],
                  ),
                )))
      ]),
    );
  }
}
