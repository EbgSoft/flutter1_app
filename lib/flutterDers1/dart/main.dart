import 'package:flutter/material.dart';

void main(){
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int kurulusyili=1907;
    return MaterialApp(
      title: "Demo Application",
      home: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Fenerbahçe",style: TextStyle(color: Colors.blue,backgroundColor: Colors.yellow ,fontSize: 44),)
            ,SizedBox(height: 50.0,)
            ,Text("Kuruluş Tarihi:" + kurulusyili.toString(),
                style: TextStyle(color: Colors.yellow,backgroundColor: Colors.blue,fontSize: 22))
            ,SizedBox(height: 50.0,)
            ,Text("Teşekkürler",
                style: TextStyle(color: Colors.white,backgroundColor: Colors.grey,fontSize: 22)),

          ],
        ),
      ),
    );
  }
}