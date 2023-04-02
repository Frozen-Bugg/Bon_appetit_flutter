import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

Widget TitleText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Text(
      text,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  );
}

Widget ListMaker(Widget child) {
  return Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(15)),
    width: 250,
    height: 200,
    child: child,
  );
}

class MealDetail extends StatelessWidget {
  final String id;
  const MealDetail({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (element) => element.id == id,
    );
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: Image.network(selectedMeal.imageUrl),
            height: 300,
            width: double.infinity,
          ),
          TitleText('Ingredients'),
          ListMaker(
            ListView.builder(
              itemBuilder: ((context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  )),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          TitleText('Steps'),
          ListMaker(ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Column(
                children: [
                  Divider(),
                  Text(selectedMeal.steps[index]),
                ],
              ),
            ),
            itemCount: selectedMeal.steps.length,
          ))
        ]),
      ),
    );
  }
}
