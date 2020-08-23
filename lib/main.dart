import 'package:flutter/material.dart';
import 'package:flutter1_app/flutterDers2/dart/main.dart';
import 'styles.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hesap Makinesi",
      color: Colors.blue,
      home: HesapMakinesi1(),
    );
  }
}

class HesapMakinesi1 extends StatefulWidget {
  @override
  _HesapMakinesi1State createState() => _HesapMakinesi1State();

  double birinci=0;
  double ikinci=0;
  double sonuc=0;
  double sonuc2=0;


}

class _HesapMakinesi1State extends State<HesapMakinesi1> {

  final _formKey = GlobalKey<FormState>();
  final inputController1 = TextEditingController();
  final inputController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Title(child: Text("Hesap Makinesi"),color: Colors.blue)),
            body:
            Container(
            padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
            child: Builder(
            builder: (context) => Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: inputController1,
                  decoration:
                  InputDecoration(labelText: "Birinci Sayı:"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Lüfen giriş yapınız";
                    } else
                      return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      widget.birinci= double.parse(val);
                    });
                  },
                ),
                TextFormField(
                  controller: inputController2,
                  decoration:
                  InputDecoration(labelText: "İkinci Sayı:"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Lüfen giriş yapınız";
                    } else
                      return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      widget.ikinci= double.parse(val);
                    });
                  },
                ),
                Text("Sonuç :" + widget.sonuc.toString(),style: Styles.sonucText,),
                RaisedButton(
                  child: Text("Topla" , style: Styles.buttonText),
                  onPressed: (){
                    setState(() {
                        widget.sonuc=widget.birinci+widget.ikinci;
                        widget.sonuc2=widget.birinci*widget.ikinci;
                    });
                  },
                ),
                Text("Çarpım Sonuç :" + widget.sonuc2.toString(),style: Styles.sonucText,),
                Text("Bye....")
              ],
            ),

      ),
    ),
    )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    inputController1.dispose();
    inputController2.dispose();
  }
}


