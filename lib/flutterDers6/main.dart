import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class BekletenIslem {

  String _beletenIslem() {

    //Web için kullanılamazi Js zaten async çalışma için optimize edilmiştir.
    sleep(const Duration(seconds:5));
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
  String ipAdres="";

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
             Text("Future, Async , Await ",style: TextStyle(fontSize: 33),),
             SizedBox(height: 45.0,),
             Text("Bittimi: " + bittiMi.toString(),style: TextStyle(fontSize: 22,
                 backgroundColor: bittiMi? Colors.green: Colors.red),),
             SizedBox(height: 15.0,),
             Text("IPAdress: " + ipAdres,style: TextStyle(fontSize: 22,
              backgroundColor: bittiMi? Colors.green: Colors.red),),
             SizedBox(height: 15.0,),

             RaisedButton(
               color: Colors.blue,
               child: Text("Bekleten Islem Sync",style: TextStyle(fontSize: 18),),
               onPressed: () async {
                 final bekleten =  BekletenIslem();
                 setState(() {
                   bittiMi=false;
                 });
                 try {
                   bittiMi = bekleten._beletenIslem()!=null;
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
               child: Text("Bekleten Islem Async",style: TextStyle(fontSize: 18),),
               onPressed: () async {
                 final bekleten =  BekletenIslem();
                 setState(() {
                   bittiMi=false;
                 });
                 try {
                   bittiMi = await bekleten._bekletenIslemAsync()!=null;
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
               child: Text("What is My IP",style: TextStyle(fontSize: 18),),
               onPressed: () async {
                 final bekleten =  BekletenIslem();
                 try{
                    ipAdres= await bekleten._IPAdress();
                    bittiMi= ipAdres!="";
                    print(ipAdres);
                  } catch(ex)
                  {

                  }
               },
             ),
           ],
        ),
      ),
    );
  }
}
