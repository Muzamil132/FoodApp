 
import 'package:flutter/material.dart';
import 'package:food/Favorite.dart';
import 'package:food/Home.dart';

 
 class Tabb extends StatefulWidget {
   @override
   _TabbState createState() => _TabbState();
 }
 
 class _TabbState extends State<Tabb> {
   @override
   Widget build(BuildContext context) {
     return DefaultTabController(
          length: 2,
          child:Scaffold(
            appBar: AppBar(
             
              bottom: TabBar(tabs: [
                Tab(
                icon:Icon(Icons.category),
                text:"Categories"
                ),
                Tab(
                icon:Icon(Icons.favorite),
                text:"Fovorite"
                ),
              ],),
            ),
            body: TabBarView(children: [
              Home(),
               Favorite()
            ],),
          ) ,
       
     );
   }
 }