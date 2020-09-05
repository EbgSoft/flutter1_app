import 'package:flutter/material.dart';

void main(){
  runApp(MyFlutter1());
}

class MyFlutter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int kurulusyili=1907;
    return MaterialApp(
      title: "Demo Application",
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        // Define the default font family.
        fontFamily: 'Tahoma',
        backgroundColor: Colors.blue
      ),
      home: Container(
        color: Colors.blue,
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