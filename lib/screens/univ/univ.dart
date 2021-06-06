import 'package:flutter/material.dart';

import '../favsscreen.dart';
import '../homescreen.dart';

class Univ extends StatefulWidget {
  const Univ({Key? key}) : super(key: key);

  @override
  _UnivState createState() => _UnivState();
}

class _UnivState extends State<Univ> {
  int _selectedIndex = 0;
  final PageController pageController = PageController();
  static const List<Widget> tabs = <Widget>[HomeScreen(), FavsScreen()];
  @override
  

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pageController,
          children: tabs,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
              pageController.animateToPage(index,
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 300));
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(color: Colors.blue),
          
          unselectedLabelStyle: TextStyle(color:Colors.grey),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.blue,),
              
              label: 'News',
              backgroundColor: Colors.blue
              
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.pink,
              ),
              label: 'Favs',
              
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              //print("$selectedpage");
              pageController.jumpToPage(index);
            });
          },
        ));
  }
}
