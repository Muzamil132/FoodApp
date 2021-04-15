import 'package:flutter/material.dart';


class DrwerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child:Column(
        children:[
          Container(
            
          


            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.teal,
            alignment: Alignment.centerLeft,
            child: Text('COOKING UP ',style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.w900
            ),),

          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
            leading: Icon(Icons.food_bank_outlined ,size: 30 ),
            title: Text('Meals',style: TextStyle(fontSize: 20 ,color: Colors.black54   ),),
          ),
          ListTile(
             onTap: (){
                Navigator.of(context).pushReplacementNamed('/Filter');
             },
            leading: Icon(Icons.settings ,size: 30 ),
            title: Text('Filters',style: TextStyle(fontSize: 20 ,color: Colors.black54   ),),
          )
        ]
      )
      
    );
  }
}