import 'package:flutter/material.dart';

//Scaffold TabbedAppBar Widget
class TabBarWidgetSayfalar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: secenekler.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter 8 TabBar Wigdets'),
            bottom: TabBar(
              isScrollable: true,
              tabs: secenekler.map<Widget>((Secenek sec) {
                return Tab(
                  text: sec.title,
                  icon: Icon(sec.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: secenekler.map<Widget>((Secenek sec) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SecilenNesne(secim: sec),
              );
            }).toList(),
          ) ,
          bottomNavigationBar:TabBar(
            unselectedLabelColor: Colors.blue,
            labelColor: Colors.orange,
            isScrollable: false,
            tabs: secenekler.map<Widget>((Secenek sec) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child:   Tab(
                  text: sec.title,
                  icon: Icon(sec.icon),
                )
              );
            }).toList(),
          ) ,
        ),
      ),
    );
  }
}

//Secenek Class
class Secenek {
  const Secenek({ this.title, this.icon });
  final String title;
  final IconData icon;
}

//Static Secenekler Listesi
const List<Secenek> secenekler = <Secenek>[
  Secenek(title: 'ARABA', icon: Icons.directions_car),
  Secenek(title: 'BİSİKLET', icon: Icons.directions_bike),
  Secenek(title: 'OTOBÜS', icon: Icons.directions_bus),
  Secenek(title: 'TREN', icon: Icons.directions_railway),
  Secenek(title: 'YAYA', icon: Icons.directions_walk),
];


//Secenekleri ekrana getirecek olan Widget
class SecilenNesne extends StatelessWidget {
  const SecilenNesne({ Key key, this.secim }) : super(key: key);

  final Secenek secim;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline3;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(secim.icon, size: 150.0, color:Colors.orange),
            Text(secim.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}