import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Ders 3",
      color: Colors.blue,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        // Define the default font family.
        fontFamily: 'Tahoma',
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Ders 3"),),
      body: _buildPage(),
    );
  }
}

Widget _buildPage()
{
  return Stack(children: <Widget>[
    _buildRow(1),
    _buildColumn(1),
  ],);
}

Widget _buildColumn(int colId)
{
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text("Column " + colId.toString(),style: TextStyle(fontSize: 33,color: Colors.black54),),
      Text("Column " + colId.toString(),style: TextStyle(fontSize: 33,color: Colors.blue),),
      Text("Column " + colId.toString(),style: TextStyle(fontSize: 33,color: Colors.orange),),
      _buildRow(1),
      _buildRow(2),
      _buildRow(3),
    ],
  );
}


Widget _buildRow(int colId)
{
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text("Row " + colId.toString(),style: TextStyle(fontSize: 33,backgroundColor: Colors.green)),
        Text("Row " + colId.toString(),style: TextStyle(fontSize: 33,backgroundColor: Colors.yellow)),
        Text("Row " + colId.toString(),style: TextStyle(fontSize: 33,backgroundColor: Colors.red)),
      ]
  );
}
