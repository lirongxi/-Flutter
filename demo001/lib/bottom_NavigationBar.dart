import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'pages/email.dart';
import 'pages/pages.dart';
import 'pages/airplay.dart';

class BottomNavgationWidget extends StatefulWidget {
  @override
  _BottomNavgationWidgetState createState() => _BottomNavgationWidgetState();
}

class _BottomNavgationWidgetState extends State<BottomNavgationWidget> {
  final _BottomNavgationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState(){
    list
      ..add(Home())
      ..add(Email())
      ..add(Pages())
      ..add(Airplay());
      super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavgationColor,
            ),
            title: Text(
              "Home",
              style:TextStyle(color:_BottomNavgationColor)
            )
          ),
           BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _BottomNavgationColor,
            ),
            title: Text(
              "Email",
              style:TextStyle(color:_BottomNavgationColor)
            )
          ),
           BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _BottomNavgationColor,
            ),
            title: Text(
              "Pages",
              style:TextStyle(color:_BottomNavgationColor)
            )
          ),
           BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _BottomNavgationColor,
            ),
            title: Text(
              "Airplay",
              style:TextStyle(color:_BottomNavgationColor)
            )
          )
        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
           _currentIndex = index; 
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}