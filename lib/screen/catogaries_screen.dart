import 'package:flutter/material.dart';
import '../widget/catogaries_item.dart';
import 'catogeries_meal_screen.dart';
import 'package:meal_app/models/dummy_data.dart';

class CatogariesScreen extends StatelessWidget {
  const CatogariesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        children:
            Dummy_catogaries.map((e) => CatogariesItem(e.title, e.color, e.id))
                .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 50));
  }
}
