import 'package:flutter/material.dart';

import 'api1.dart';
import 'api2.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _currentindex =0;
  List<Widget> tabs = <Widget>[Api1(),Api2()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Api Integration")),
      ),
      body:   tabs[_currentindex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        currentIndex: _currentindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.api) ,
              label: "Api1"),
          BottomNavigationBarItem(
              icon: Icon(Icons.api),
              label:"Api2"),

        ],
        onTap: (index){
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}
