import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/routes/routes_const.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.id});

  void selectMeal(BuildContext context) {
    GoRouter.of(context).pushNamed(RoutesName.item, params: {'id': id});
  }

  String get ComplexityText {
    switch (complexity) {
      case (Complexity.Simple):
        return 'Simple';
      case (Complexity.Hard):
        return 'Hard';
      case (Complexity.Challenging):
        return 'Challenging';
    }
  }

  String get AffordabilityText {
    switch (affordability) {
      case (Affordability.Affordable):
        return 'Affordable';
      case (Affordability.Pricey):
        return 'Pricey';
      case (Affordability.Luxurious):
        return 'Luxurious';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        selectMeal(context);
      }),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(ComplexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(AffordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
