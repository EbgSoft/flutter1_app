import 'package:flutter/material.dart';
import 'package:flutter1_app/flutterDers7/shape/cross.dart';
import 'package:flutter1_app/flutterDers7/shape/divide.dart';
import 'package:flutter1_app/flutterDers7/shape/minus.dart';
import 'package:flutter1_app/flutterDers7/shape/plus.dart';
import 'package:flutter1_app/flutterDers7/shape/circle.dart';

class SekilOlusturucu extends StatefulWidget {
  SekilOlusturucu({Key key})
      : super(key: key);

  @override
  SekilOlusturucuState createState() => SekilOlusturucuState();
}

class SekilOlusturucuState extends State<SekilOlusturucu> {
  BuildContext _context;

  bool firstStateEnabled=false;
  String title="Toplam";

  SekilOlusturucuState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    print('build screen');
    return Scaffold(
        key: _scaffoldKey ,
        appBar: AppBar(
          title: Text(title),
          actions: [
/*            RaisedButton(
            child: Text("O"),
            onPressed: () async {
                setState(() {
                  title="Daire";
                  firstStateEnabled = true;
                });
               await Future.delayed(Duration(seconds: 1) );
               setState(() {
                 firstStateEnabled = false;
               });
             }),
            RaisedButton(
                child: Text("+"),
                onPressed: () async {
                  setState(() {
                    title="Toplama";
                    firstStateEnabled = true;
                  });
                  await Future.delayed(Duration(seconds: 1) );
                  setState(() {
                    firstStateEnabled = false;
                  });
                }),
            RaisedButton(
                child: Text("-"),
                onPressed: () async {
                  setState(() {
                    title="Çıkarma";
                    firstStateEnabled = true;
                  });
                  await Future.delayed(Duration(seconds: 1) );
                  setState(() {
                    firstStateEnabled = false;
                  });
                }),
            RaisedButton(
                child: Text("X"),
                onPressed: () async {
                  setState(() {
                    title="Çarpma";
                    firstStateEnabled = true;

                  });
                  await Future.delayed(Duration(seconds: 1) );
                  setState(() {
                    firstStateEnabled = false;
                  });
                }),
            RaisedButton(
                child: Text("/"),
                onPressed: () async {
                  setState(() {
                    title="Bölme";
                    firstStateEnabled = true;
                  });
                  await Future.delayed(Duration(seconds: 1) );
                  setState(() {
                    firstStateEnabled = false;
                  });
                }),*/
          ],
        ),
        body:
          Builder(builder: (BuildContext context) {
              _context = context;
             return buildAnimatedImage();
          }),
    );
  }

  Widget buildAnimatedImage() {

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title,style: TextStyle(fontSize: 22,color: Colors.orange),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(
                    child: Text("O"),
                    onPressed: () async {
                      setState(() {
                        title="Daire";
                        firstStateEnabled = true;
                      });
                      await Future.delayed(Duration(seconds: 1) );
                      setState(() {
                        firstStateEnabled = false;
                      });
                    }),
                RaisedButton(
                    child: Text("+"),
                    onPressed: () async {
                      setState(() {
                        title="Toplama";
                        firstStateEnabled = true;
                      });
                      await Future.delayed(Duration(seconds: 1) );
                      setState(() {
                        firstStateEnabled = false;
                      });
                    }),
                RaisedButton(
                    child: Text("-"),
                    onPressed: () async {
                      setState(() {
                        title="Çıkarma";
                        firstStateEnabled = true;
                      });
                      await Future.delayed(Duration(seconds: 1) );
                      setState(() {
                        firstStateEnabled = false;
                      });
                    }),
                RaisedButton(
                    child: Text("X"),
                    onPressed: () async {
                      setState(() {
                        title="Çarpma";
                        firstStateEnabled = true;

                      });
                      await Future.delayed(Duration(seconds: 1) );
                      setState(() {
                        firstStateEnabled = false;
                      });
                    }),
                RaisedButton(
                    child: Text("/"),
                    onPressed: () async {
                      setState(() {
                        title="Bölme";
                        firstStateEnabled = true;
                      });
                      await Future.delayed(Duration(seconds: 1) );
                      setState(() {
                        firstStateEnabled = false;
                      });
                    }),
              ],
            ),
            Center(child: AnimatedCrossFade(
              firstChild: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircularProgressIndicator(),
                ),
                height: 400.0,
                width: 400.0,
              ),
              secondChild: Container(
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(child: buildGameCategoryWidget(),)
                ),
                height: 400.0,
                width: 400.0,
              ),
              crossFadeState: firstStateEnabled
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(milliseconds: 1000,),
            )
          )
          ],
        );
      }

  Widget buildGameCategoryWidget()
  {
    if (title=="Daire")
    {
      return Circle();
    }
    if (title=="Toplama")
    {
      return Plus();
    }
    else if (title=="Çıkarma")
    {
      return Minus();
    }
    else if (title=="Çarpma")
    {
      return Cross();
    }
    else if (title=="Bölme")
    {
      return Divide();
    }
  }
}
