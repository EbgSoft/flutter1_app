import 'package:flutter/material.dart';


void main() {
  runApp(MyFlutter5());
}

class MyFlutter5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Ders 5",
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  String mesaj="Button Durumu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Ders 5"),

      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //bir row yapalım ve buraya buttonları koyalım
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Benim Butonum"
                    ,style: TextStyle(fontSize: 15),),
                  onPressed: () {
                    setState(() {
                      mesaj="RaisedButona basıldı";
                    });
                    debugPrint(mesaj);
                  },
                  color: Colors.blue,
                ),
                FlatButton(
                  child: Icon(
                    Icons.star,color: Colors.orange,
                  ),
                  hoverColor: Colors.green,
                  onPressed: () {
                    setState(() {
                      mesaj="FlatButona basıldı";
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.thumb_up,color: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      mesaj="IconButtona basıldı";
                    });
                  },
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      mesaj="Elma üzerine tıklandı";
                    });
                  },
                  child: Column(
                    children: [
                      Text("Bu Bir Elma"),
                      Image(
                        image: AssetImage("assets/images/elma.jpg"),
                        width: 100,
                        height: 100,
                      )
                    ],
                  ) ,
                )
              ],
            ),
            //boşuk bırakalım
            SizedBox(height: 50,)
            //bir text output yapalım
            ,Text(mesaj,style: TextStyle(fontSize: 22,color: Colors.orange),)
            ,SizedBox(height: 50,)
            //image gösterelim
            ,GestureDetector(
              onTap: () {
                setState(() {
                  mesaj="Resim üzerine tıklandı";
                });
              },
              onDoubleTap: () {
                setState(() {
                  mesaj="Resim üzerinde çift tıklandı";
                });
              },
              child:     Image(
                image: AssetImage("assets/images/flutter-5-1.png"),
                width: 350,
                height: 200,
              ),
            )

          ],
        ),
      ),
    );
  }
}
