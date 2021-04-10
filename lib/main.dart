import 'package:flutter/material.dart';
import 'package:flutter1_app/flutterDers8/main.dart';

void main() {
  runApp(Myflutter8());
}

class Myflutter8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(color: Colors.blue,
      debugShowCheckedModeBanner: false,
      title: "Flutter8",
      home: TabbedAppBarSayfalar()
    );
  }
}
