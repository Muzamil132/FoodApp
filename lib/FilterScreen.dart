import 'package:flutter/material.dart';
import './Widgets/Drawer.dart';

class FilterScreen extends StatefulWidget {

 final Function saveFilter;
  Map<String,bool> filters;
 FilterScreen(this.filters,this.saveFilter,);

  @override


  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

 bool _gluteenFree =false;
 bool _vegeterenFree =false;
 bool veganFree_ =false;
 bool _loctoseFree =false;


 

 Function saveFilter;

 @override

 initState(){
_gluteenFree=widget.filters['gluten'];
_vegeterenFree=widget.filters['vegetarian'];
veganFree_=widget.filters['vegan'];
_loctoseFree=widget.filters['lactose'];

super.initState();

 }



 Widget _buildFilter( String title,String desc,bool currentValue,Function updateValue  ){

  return SwitchListTile(title: Text(title),value:currentValue,
            
            subtitle: Text(desc),
            onChanged: updateValue
            
            );


 }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Filters'
      
      
      ),
      actions: [
        IconButton(icon: Icon(Icons.save), onPressed:(){

         final  selected={
       
       'gluten':_gluteenFree,
       'lactose':_loctoseFree,
       'vegan':veganFree_,
       'vegetarian':_vegeterenFree,
  };
       
      //  print(selected);
         widget.saveFilter(selected);
        }
        )
      ],
      ),

      drawer:DrwerScreen(),

      body:Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection'
                   ,
            style: TextStyle(color: Colors.black87),
          ),
        ),
        Expanded(child: ListView(
          children: [
           _buildFilter('Gluteen Free', "Onlu Gluteen free meals", _gluteenFree, (newValue){
             setState(() {
               _gluteenFree=newValue;
             });
           }),
           _buildFilter('Lactose Free', "Only Meals with Lactose free meals", _loctoseFree, (newValue){
             setState(() {
               _loctoseFree=newValue;
             });
           }),
           _buildFilter('Vegan Free', "Vegan  free meals",  veganFree_, (newValue){
             setState(() {
              veganFree_ =newValue;
             });
           }),
           _buildFilter('Vegeterean', "Only  Vegeterian  meals", _vegeterenFree, (newValue){
             setState(() {
               _vegeterenFree=newValue;
             });
           }),
          ],
        ))
      ],)

      
    );
  }
}