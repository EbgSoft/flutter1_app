import 'package:flutter/material.dart';
import 'styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hesap Makinesi",
      color: Colors.blue,
      home: HesapMakinesi(),
    );
  }
}


class HesapMakinesi extends StatefulWidget {
  @override
  _HesapMakinesiState createState() => _HesapMakinesiState();

  double birinci=0;
  double ikinici=0;
  double sonuc=0;

}

class _HesapMakinesiState extends State<HesapMakinesi> {

  final _formKey = GlobalKey<FormState>();
  final inputController1 = TextEditingController();
  final inputController2 = TextEditingController();


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
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(title: Title(child: Text("Hesap Makinesi"),color: Colors.blue)),
        body:
          Container(
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
          child: Builder(
          builder: (context) => Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            SizedBox(height: 3,),
                  TextFormField(
                decoration:
                InputDecoration(labelText: "Birinci Sayı:"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Lüfen giriş yapınız";
                  } else
                    return null;
                },
                controller: inputController1,
                onChanged: (val) =>
                    setState(() => widget.birinci= double.parse(val)),
              ),
              SizedBox(height: 3,),
              TextFormField(
                decoration:
                InputDecoration(labelText: "İkinci Sayı:"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Lüfen giriş yapınız";
                  } else
                    return null;
                },
                controller: inputController2,
                onChanged: (val) =>
                    setState(() => widget.ikinici= double.parse(val)),
              ),
              Text("Sonuç : " + widget.sonuc.toString(), style: Styles.sonucText),
              RaisedButton(
                child: Text(" Topla ",style: Styles.buttonText,),
                onPressed: () {
                  setState(() {
                    widget.sonuc=widget.birinci+ widget.ikinici;
                  });

                },
              ),


            ]),
    ),)

    )
    );
  }
}

