
import 'package:flutter/material.dart';
import '../models/Meal.dart';
class MealItem extends StatelessWidget {

  final String id;
  final String imgUrl ;
  final String title;
  final int duration;
  final Complexity complexity ;
  final Affordability affordility;
  final Function remove ;

  const MealItem({Key key,this.remove,this.id, this.imgUrl, this.title, this.duration, this.complexity, this.affordility}) : super(key: key);

    String get ComplexityText{
           switch(complexity){

             case Complexity.Simple:
               return 'Simple';
               break;
             case Complexity.Challenging:
               return 'Challenging';
               break;
             case Complexity.Hard:
               return 'Hard';
               break;
           }

           
    }

    String get AffordabilityText{
           switch(affordility){

             case Affordability.Affordable:
               return 'Affordable';
               break;
             case Affordability.Pricey:
               return 'Precious';
               break;
             case Affordability.Luxurious:
               return 'Luxirious';
               break;
           }

           
    }

    void SelectMeal(BuildContext context){
       Navigator.of(context).pushNamed('/MealDetails',arguments: id)
       .then((value) => remove(value));
       
       
          
    }
  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: ()=>SelectMeal(context),
      
      child: Card(
         shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
         margin: EdgeInsets.all(10),
         elevation: 4,
         child: Column(
           children:[
             Stack(children: [
               ClipRRect(

                 borderRadius: BorderRadius.only(
                   topLeft:Radius.circular(15),
                   topRight:Radius.circular(15),
                  
                 ),
                  child:Image.network(imgUrl,
                  
                  height:250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  )
               ),
               Positioned(
                 bottom: 20,
                 right: 0,
                                child:Container(

                                  padding: EdgeInsets.all(8), 
                                  width: 220,
                                  color: Colors.black38,

                                  child: Text(
                   title,
                   style: TextStyle(color: Colors.white,fontSize: 22),
                    softWrap: true,
                     overflow: TextOverflow.fade,
                 ),
                                ),
               )
             ],),
           Padding(padding: EdgeInsets.all(8),
             child: Row(

               mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                   children: [
                     Icon(Icons.schedule)
                     ,SizedBox(
                       width: 6,
                     ),
                     Text('$duration')
                   ],
                ),
                Row(
                   children: [
                     Icon(Icons.food_bank)
                     ,SizedBox(
                       width: 6,
                     ),
                     Text(ComplexityText)
                   ],
                ),
                Row(
                   children: [
                     Icon(Icons.attach_money)
                     ,SizedBox(
                       width: 6,
                     ),
                     Text(AffordabilityText)
                   ],
                )
              ],
             ),
           
           )
           ]
         ),
    
      ),
    );
  }
}