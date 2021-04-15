
import 'package:food/Widgets/MealItem.dart';
import 'package:food/data/Category.dart';
import 'package:flutter/material.dart';
import 'package:food/models/Meal.dart';


class CategoryMeal extends StatefulWidget {

  // final String title;
  // final String id;
  // const CategoryMeal({
  
  //   @ required this.title,
  //   @ required this.id,
  // }) ;
   final List<Meal> availblemeals;
   CategoryMeal(this.availblemeals);

  @override
  _CategoryMealState createState() => _CategoryMealState();

}

class _CategoryMealState extends State<CategoryMeal> {

   String title;

  List<Meal> mealtypes;
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
     title = routeArgs['title'];
      final categoryId = routeArgs['id'];
     mealtypes = widget.availblemeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      mealtypes.removeWhere((meal) => meal.id == mealId);
    });
  }
  Widget build(BuildContext context) {

   
  
    return Scaffold(
    appBar: AppBar(title:Text(title)
    ),
      body: ListView.builder(
        itemCount: mealtypes.length,
        itemBuilder: 
      (context,index){
        return MealItem(
          id:mealtypes[index].id,
          title:mealtypes[index].title, 
          imgUrl:mealtypes[index].imageUrl,  
          duration: mealtypes[index].duration,
          complexity:mealtypes[index].complexity ,
          affordility: mealtypes[index].affordability,
          remove: _removeMeal,
        );
      }
      )
    );
  }
}
