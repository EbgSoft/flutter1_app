import 'package:flutter/material.dart';

void main() {
  runApp(TabBarWidgetSayfalar());
}

//Scaffold TabbedAppBar Widget
class TabBarWidgetSayfalar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: secenekler.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Flutter 8 TabBar Widgets"),
            bottom: TabBar(
              tabs: secenekler.map<Widget>((Secenek sec) {
                  return Tab(
                    text: sec.title,
                    icon: Icon(sec.icon),
                  );
              }).toList()
            ),
          ),
          body: TabBarView(
              children: secenekler.map<Widget>((Secenek sec) {
                return SecilenNesne(secim:sec);
              }).toList(),
          ),
          bottomNavigationBar: TabBar(
              unselectedLabelColor: Colors.blue,
              labelColor: Colors.orange,
              tabs: secenekler.map<Widget>((Secenek sec) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child:Tab(
                    text: sec.title,
                    icon: Icon(sec.icon),
                  )
                );

              }).toList()
          ),
        ),

      ),
    );
  }
}



//Secenek Class

class Secenek {
  final String title;
  final IconData icon;

  const Secenek({this.title, this.icon});
}

//Static Secenekler Listesi

const List<Secenek> secenekler=<Secenek> [
  Secenek(title: 'ARABA',icon: Icons.directions_car),
  Secenek(title: 'BİSİKLET',icon: Icons.directions_bike),
  Secenek(title: 'OTOBÜS',icon: Icons.directions_bus),
  Secenek(title: 'TREN',icon: Icons.directions_railway),
  Secenek(title: 'YAYA',icon: Icons.directions_walk)
];


//Secenekleri ekrana getirecek olan Widget

class SecilenNesne extends StatelessWidget {

  final Secenek secim;

  const SecilenNesne({Key key, this.secim}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textstyle= Theme.of(context).textTheme.headline3;
    return Card(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(secim.icon,size: 130, color: Colors.orange,),
            Text(secim.title,style: textstyle),
          ],
        ),
      ),
    );
  }
}

