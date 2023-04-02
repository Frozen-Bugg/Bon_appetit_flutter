import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/models/dummy_data.dart';
import 'package:meal_app/widget/meal_item.dart';

class CatogariesMeal extends StatelessWidget {
  final String title;
  final String id;
  CatogariesMeal({required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    final categariesMeal = filter.availableMeal.where((meal) {
      // print(id);
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          // print(categariesMeal.length);
          return MealItem(
            title: categariesMeal[index].title,
            imageUrl: categariesMeal[index].imageUrl,
            duration: categariesMeal[index].duration,
            complexity: categariesMeal[index].complexity,
            affordability: categariesMeal[index].affordability,
            id: categariesMeal[index].id,
          );
        }),
        itemCount: categariesMeal.length,
      ),
    );
  }
}
