









import 'package:flutter/material.dart';
import 'package:food/FilterScreen.dart';
import './BottomTabbar.dart';

import 'package:food/MealDetails.dart';
import './Widgets/CategoryMealScreen.dart';
import './models/Meal.dart';
import './data/Category.dart';
// import 'package:food/Widgets/Categoryitem.dart';
// import 'package:food/data/Category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

 


  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

 
}



class _MyAppState extends State<MyApp> {

   Map<String,bool> _filters={
       
       'gluten':false,
       'lactose':false,
       'vegan':false,
       'vegetarian':false,
  };

  List<Meal> availablemeals =mealist;
void filterDta(Map<String,bool> filterData){

               setState(() {
                 _filters=filterData;

                 availablemeals=mealist.where((meal){
                   if(_filters['gluten'] && !meal.isGlutenFree){

                         return false;
                   }
                   if(_filters['lactose'] && !meal.isLactoseFree){

                         return false;
                   }
                   if(_filters['vegan'] && !meal.isVegan){

                         return false;
                   }
                   if(_filters['vegetarian'] && !meal.isVegetarian){

                         return false;
                   }
                         return true;

                 }
                 
               
                 ).toList();
               }); 

               print(availablemeals);
}
  @override
  Widget build(BuildContext context) {
     ThemeData theme = ThemeData();
    return MaterialApp(
     

      theme: theme.copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.blueGrey,
          brightness: Brightness.light,
          elevation: 0,

        
          //I want the defaults, which is why I'm copying an 'empty' ThemeData
         
          iconTheme: IconThemeData(color: Colors.white),
          
        )
      ),

      routes: {

        "/":(context)=>BottomTab(),
        "/category":(context)=>CategoryMeal(availablemeals),
        "/MealDetails":(context)=>MealDetails(),
        "/Filter":(context)=>FilterScreen(_filters,filterDta),
      },
   
          title: 'Flutter Demo',
     
    
    );
  }
}

