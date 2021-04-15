
import 'package:flutter/material.dart';
import 'package:food/Favorite.dart';
import './Home.dart';
import './Widgets/Drawer.dart';

class BottomTab extends StatefulWidget {
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {

  List<Widget> pages =[Home()  , Favorite() ];


int selectedIndex =0;
void onSelect(int index){
  setState(() {
    selectedIndex=index;
  });
}

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title:Text('Meals')
      ),
      drawer: DrwerScreen(),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          
          onTap: onSelect,
          currentIndex: selectedIndex,

        backgroundColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category), title:Text('Categories')    ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title:Text('Favorite')    ),
        ],
      ),
      
    );
  }
}