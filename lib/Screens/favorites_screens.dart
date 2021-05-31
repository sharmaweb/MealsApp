import 'package:flutter/material.dart';
import '../Widgets/meals_item.dart';
import '../models/meal.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    
  if(favoriteMeals.isEmpty){
      return   Center(
      child: Text('This is Favorites'),
      
    );

      }
      else{
        return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealsItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              complexity:favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
              duration: favoriteMeals[index].duration,
              
            );
          },
          itemCount: favoriteMeals.length,
        );

      }
    
  
}
}