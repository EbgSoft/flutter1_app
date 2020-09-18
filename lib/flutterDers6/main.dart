import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class BekletenIslem {

  Future<String> _beklenenIslemAsync() async {

    return Future.delayed(const Duration(seconds: 5), () => "Bitti");

  }

  bool _beklenenIslemSync()
  {
    //sleep not available on the web because Javascript is really async-only.
    //sleep(Duration(seconds:5));
    Duration(seconds: 5);

  }

  Future<String> _getIPAddress() async {
    final url = 'https://httpbin.org/ip';
    final response = await http.get(url);
    String ip = jsonDecode(response.body)['origin'];
    return ip;
  }
}


void main() {
  runApp(MyFlutter6());
}

class MyFlutter6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Ders 6",
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  String ipAdress="";

  bool bittiMi=false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/images/ebgsoftlogo.png",width: 100, height: 50,),
            SizedBox(width: 5,),
            Text("Flutter 6")
          ],
        )
      ),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text("Future, Sync,  Async ",style: TextStyle(fontSize: 33),),
             SizedBox(height: 45.0,),
             Text("Bittimi: " + bittiMi.toString(),style: TextStyle(fontSize: 22,
                 backgroundColor: bittiMi? Colors.green: Colors.red),),
             SizedBox(height: 15.0,),
             Text("IPAdress: " + ipAdress,style: TextStyle(fontSize: 22,
              backgroundColor: bittiMi? Colors.green: Colors.red),),
             SizedBox(height: 15.0,),
             RaisedButton(
               color: Colors.blue,
               child: Text("Bekleten Islem Async",style: TextStyle(fontSize: 18),),
               onPressed: () async {
                 final bekleten = new BekletenIslem();
                 setState(() {
                   bittiMi=false;
                 });
                 try {
                   bittiMi = await bekleten._beklenenIslemAsync()!=null;
                    setState(() {

                    });
                   print(bittiMi);
                 } catch (error) {
                   print(error);
                 }
               },
             ),
             RaisedButton(
               color: Colors.blue,
               child: Text("Bekleten Islem Sync",style: TextStyle(fontSize: 18),),
               onPressed: () async {
                 final bekleten = new BekletenIslem();
                 setState(() {
                   bittiMi=false;
                 });
                 try {
                   bittiMi = await bekleten._beklenenIslemSync()!=null;
                   setState(() {
                     bittiMi=true;
                   });
                   print(bittiMi);
                 } catch (error) {
                   print(error);
                 }
               },
             ),
             RaisedButton(
               color: Colors.blue,
               child: Text("What is My IP",style: TextStyle(fontSize: 18),),
               onPressed: () async {
                 final example1 = new BekletenIslem();
                 try {
                   ipAdress = await example1._getIPAddress();
                   setState(() {

                   });
                   print(ipAdress);
                 } catch (error) {
                   print(error);
                 }
               },
             ),
           ],
        ),
      ),
    );
  }
}
