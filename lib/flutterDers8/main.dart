import 'package:flutter/material.dart';

class TabbedAppBarSayfalar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: secenekler.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TabBar Wigdets'),
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
              return Tab(
                text: sec.title,
                icon: Icon(sec.icon),
              );
            }).toList(),
          ) ,
        ),
      ),
    );
  }
}

class Secenek {
  const Secenek({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<Secenek> secenekler = <Secenek>[
  Secenek(title: 'ARABA', icon: Icons.directions_car),
  Secenek(title: 'BİSİKLET', icon: Icons.directions_bike),
  Secenek(title: 'OTOBÜS', icon: Icons.directions_bus),
  Secenek(title: 'TREN', icon: Icons.directions_railway),
  Secenek(title: 'YAYA', icon: Icons.directions_walk),
];

class SecilenNesne extends StatelessWidget {
  const SecilenNesne({ Key key, this.secim }) : super(key: key);

  final Secenek secim;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(secim.icon, size: 150.0, color: textStyle.color),
            Text(secim.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}