import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/routes/routes_const.dart';
import 'package:meal_app/widget/main_drawer.dart';
import 'package:meal_app/main.dart';

import '../models/dummy_data.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Widget _buildSwitch(String title, bool val, void Function(bool) update) {
    return SwitchListTile(
      value: val,
      title: Text(title),
      onChanged: update,
    );
  }

  void setFilter() {
    setState(() {
      filter.availableMeal = DUMMY_MEALS.where((meal) {
        print('setsetate');
        if (filter.glutenfree && !meal.isGlutenFree) return false;
        if (filter.lactosefree && !meal.isLactoseFree) return false;
        if (filter.vegeterian && !meal.isVegetarian) return false;
        if (filter.vegan && !meal.isVegan) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                onPressed: (() {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          title: Text('Filter Saved'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Ok'))
                          ],
                        );
                      }));
                  return setFilter();
                }),
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              child: Text(
                'Adjust Your Filter',
                style: TextStyle(fontSize: 22),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitch('Gluten Free', filter.glutenfree, ((p0) {
                  setState(() {
                    filter.glutenfree = p0;
                  });
                })),
                _buildSwitch('Vegeterial', filter.vegeterian, ((p0) {
                  setState(() {
                    filter.vegeterian = p0;
                  });
                })),
                _buildSwitch('Vegan', filter.vegan, ((p0) {
                  setState(() {
                    filter.vegan = p0;
                  });
                })),
                _buildSwitch('Lactose Free', filter.lactosefree, ((p0) {
                  setState(() {
                    filter.lactosefree = p0;
                  });
                })),
              ],
            ))
          ],
        ));
  }
}
