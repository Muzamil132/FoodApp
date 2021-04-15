import 'package:flutter/material.dart';
// import 'package:food/Widgets/CategoryMealScreen.dart';

class Categoryitem extends StatelessWidget {

final String title;
final Color color;
final String id;
  const Categoryitem({
 
    @required this.title,
    
    @required this.color,

    @required this.id
  }) ;

     void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
     "/category",
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(

    onTap:()=>selectCategory(context),
     
      child: Card(
        
             shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
            child: Container(
              padding: const EdgeInsets.all(16),

          child:Text(title  ,style: TextStyle(color: Colors.white  ,fontWeight: FontWeight.bold),),
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
               Colors.green[100],
               color
                
              ],
            )
          ),
          
        ),
      ),
    );
  }
}
