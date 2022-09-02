import 'package:contact_info/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class bar extends StatefulWidget {
  const bar({Key? key}) : super(key: key);

  @override
  State<bar> createState() => _barState();
}

class _barState extends State<bar> {
  int index=0;
  final screen=[
    Home(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      drawer: Drawer(),
      appBar: AppBar(
          title: Text(
            'Main',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu,
                color: Colors.purple,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.lock),
              color: Colors.purple,
              tooltip: 'Go to Settings',
              onPressed: () {},
            ),
          ]
      ),
      body:screen[index],
      // Home(),
      bottomNavigationBar: CurvedNavigationBar(
        color :Colors.purple,
        buttonBackgroundColor: Colors.purple,
        backgroundColor: Colors.white,
        items: [
          Icon(Icons.home,
            color: Colors.white,),
          Icon(Icons.contact_phone,
            color: Colors.white,),
          Icon(Icons.settings,
            color: Colors.white,),
        ],
        onTap:(index){
          setState(() {

            this.index=index;

          });

        },
      ),
    );
  }
}