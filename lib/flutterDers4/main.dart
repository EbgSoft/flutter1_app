import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyFlutter4());
}

class MyFlutter4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Ders 4",
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
        appBar: AppBar(
            title: Text("Flutter Ders 4")
        ),
        body: _buildPage()
    );
  }
}

Widget _buildPage(){
  return ListView(
    // crossAxisAlignment: CrossAxisAlignment.center,
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text("Takip Etmeyi Unutmayın!!!",style: TextStyle(fontSize: 44,color: Colors.green),),
      _buildLocalImage("assets/images/flutter-1.png"),
      _buildLocalImage("assets/images/flutter-2.png"),
      _buildLocalImage("assets/images/flutter-3.png"),
      _buildLocalImage("assets/images/flutter-4.png"),
      _buildNetworkImage("http://ebg-soft.com/img/showcase/Me_Ma_512.jpg"),
      _buildNetworkImage("http://ebg-soft.com/img/showcase/picture_puzzle_512x512.jpg"),
      _buildNetworkImage("http://ebg-soft.com/img/showcase/Math-Pu_named_512x512.jpg"),
      _buildNetworkImage("http://ebg-soft.com/img/showcase/Me_Ma_512.jpg"),

    ],
  );
}

Widget _buildLocalImage(String imageAdresi)
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Image(image: AssetImage(imageAdresi),width: 350, height: 350,)
    ],
  );
}

Widget _buildNetworkImage(String imageAdresi)
{
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Image(image: NetworkImage(imageAdresi),width: 350, height: 350,),
      SizedBox(width: 10,height: 10,)
    ],
  );
}