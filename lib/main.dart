import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(MyFlutter6());
}

class BekletenIslem {

  String _beletenIslem() {
     sleep(Duration(seconds: 5));
    return "Bitti";
  }

  Future<String> _bekletenIslemAsync() async {

    return Future.delayed(Duration(seconds: 5), () => "Bitti" );
  }

  Future<String> _IPAdress() async {
    final response = await http.get("https://httpbin.org/delay/5");

    String ip = jsonDecode(response.body)['origin'];
    return ip;
  }

 }

class MyFlutter6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter 6",
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();


}

class _MyPageState extends State<MyPage> {

  bool Bittimi=false;
  String ipAdres="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/images/ebgsoftlogo.png",width: 100,height: 50),
            SizedBox(width: 5,),
            Text("Flutter 6")
          ],
        ),
      ),
      body: Center(
        child:
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Future, Async, Await", style: TextStyle(fontSize: 33),),
          SizedBox(height: 10,),
          Text("İşlem Bitti: " + Bittimi.toString() ,style: TextStyle(fontSize: 22,color: Bittimi? Colors.green: Colors.red),),
          Text("IP Adresi: " + ipAdres ,style: TextStyle(fontSize: 22,color: Bittimi? Colors.green : Colors.red),),

          RaisedButton(
            color: Colors.blue,
            child: Text("Sync İşlemi"),
            onPressed: () async {
              final BekletenIslem beklet= BekletenIslem();
              setState(() {
                Bittimi=false;
              });
              setState(() {
                Bittimi=beklet._beletenIslem()!=null;
              });
            },
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text("Async İşlemi"),
            onPressed: () async {
              final BekletenIslem beklet= BekletenIslem();
              setState(() {
                Bittimi=false;
              });

              try{
                Bittimi= await beklet._bekletenIslemAsync()!=null;
              }catch(ex)
              {

              }
              print(Bittimi);
              setState(()  {

              });
            },
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text("Get IP Adress"),
            onPressed: () async {
              final BekletenIslem beklet= BekletenIslem();
              setState(() {
                Bittimi=false;
              });

              try{
                ipAdres= await beklet._IPAdress();
                Bittimi= ipAdres!="";
              }catch(ex)
              {

              }
              print(Bittimi);
              setState(()  {

              });
            },
          )
        ],
      ),
    ),
    );
  }
}

