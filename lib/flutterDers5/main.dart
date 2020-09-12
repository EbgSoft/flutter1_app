import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
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
  String mesaj="Button Durum";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Flutter Ders 5"),
        ),
        body:
        Container(
          padding:EdgeInsets.only(top: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text("My Button"),
                    onPressed: (){
                      setState(() {
                        mesaj="RaisedButton Basıldı.";
                        debugPrint(mesaj);
                      });
                    },
                  ),
                  FlatButton(
                    child: Icon(Icons.thumb_up,color: Colors.blueGrey,),
                    color: Colors.transparent,
                    hoverColor: Colors.green,
                    onPressed: (){
                      setState(() {
                        mesaj="FlatButton Basıldı.";
                        debugPrint(mesaj);
                      });
                    },
                  ),
                  IconButton(icon: Icon(Icons.person),
                      color: Colors.orange,
                      onPressed: (){
                        setState(() {
                          mesaj="IconButton  Basıldı.";
                          debugPrint(mesaj);
                        });
                      }
                  ),
                  GestureDetector(
                    child: Image(image: AssetImage("assets/images/elma.jpg"),width: 100,height: 100, ),
                    onTap: () {
                      setState(() {
                        mesaj="Image Üzerine Basıldı.";
                        debugPrint(mesaj);
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        mesaj="Image Üzerine çift tıklandı";
                        debugPrint(mesaj);
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 100,),
              Text(mesaj, style: TextStyle(
                fontSize: 22,
                color: Colors.orange
              ),),
              Image(image: AssetImage("assets/images/flutter-5.png"),
                  width: 300, height: 250),
            ],
          ),

        )

    );
  }
}

