  
  import 'package:flutter/material.dart';
import 'package:food/Widgets/Categoryitem.dart';
import 'package:food/data/Category.dart';
  class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  return Scaffold(
  
    body: GridView.builder(  

      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
    
      itemCount: mylist.length,
      itemBuilder: (BuildContext context,int index){

           return Categoryitem(title: mylist[index].title, color: mylist[index].color,id: mylist[index].id);
      },
      
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          
          maxCrossAxisExtent: 200
          ,childAspectRatio: 3/2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 20


      ))
  );
 
  }
}