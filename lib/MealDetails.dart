
import 'package:flutter/material.dart';
import 'package:food/data/Category.dart';
class MealDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final mealId =ModalRoute.of(context).settings.arguments;
    final mealItem =mealist.firstWhere((element) => element.id==mealId);

    
    return Scaffold(
     appBar: AppBar(
       title: Text('${mealItem.title}'),
     ),
     body: SingleChildScrollView(
       child: Column(
          children: [
             Container(
               height: 220,
               width: double.infinity,

               child:Image.network(mealItem.imageUrl,fit:BoxFit.cover)

             ),
             Container(
               alignment: Alignment.center,
               height:40,
               
               
               child:Text(

                 "INGREDIENTS",
                 style: TextStyle(fontSize: 20),
               )
             )
               ,
            Container(
              height:200,
         
               
              alignment: Alignment.center,
              child :Card(

                  elevation: 3,

                 
                            child: Container(
                  width:350,
                  padding: EdgeInsets.symmetric(horizontal:10,vertical: 10),

                
                  
                  decoration: BoxDecoration(
                
                   borderRadius: BorderRadius.circular(13)
                  
                  ),
                  child: ListView.builder(
                    itemCount: mealItem.ingredients.length,
                  
                    itemBuilder: (context,index){
                      return  Container(  
                        
                        padding: EdgeInsets.symmetric(horizontal:20,vertical: 5),
                      
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Colors.teal
                           
                          

                        ),

                        child: Text(mealItem.ingredients[index] ,style: TextStyle(fontSize: 16  ,color: Colors.white ),   ));
                    
                      
                    }
                    ),
                ),
              )
            )
            ,Container(
               alignment: Alignment.center,
               height:40,
               
               
               child:Text(

                 "STEPS",
                 style: TextStyle(fontSize: 20),
               )
             )
               ,

                Container(
              height:200,
         
               
              alignment: Alignment.center,
              child :Card(

                  elevation: 3,

                 
                            child: Container(
                  width:350,
                  padding: EdgeInsets.symmetric(horizontal:10,vertical: 10),

                
                  
                  decoration: BoxDecoration(
                
                   borderRadius: BorderRadius.circular(13)
                  
                  ),
                  child: ListView.builder(
                    itemCount: mealItem.steps.length,
                  
                    itemBuilder: (context,index){
                      return  Container(  
                        
                        padding: EdgeInsets.all(4),
                      
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                        
                           
                          

                        ),

                       
                       child: Row(
                        children:[
                          Container(
                            alignment: Alignment.center,
                            height: 34,
                            width: 34,
                            child: Text('${index+1}'  ,  style: TextStyle(color: Colors.white),),
                            decoration: BoxDecoration(

                              color: Colors.teal,
                               
                              borderRadius: BorderRadius.circular(30)

                            ),
                          )
                        ,
                          SizedBox(width: 10),
                          Flexible(child: Text(mealItem.steps[index]))
                        ]
                       ),
                       );
                    
                      
                    }
                    ),
                ),
              )
            )

          ],
       ),
     ),
     floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.teal,
       onPressed: (){
         Navigator.of(context).pop(mealId);
       },
       child: Icon(Icons.delete ),
       
     ),
    );
  }
}