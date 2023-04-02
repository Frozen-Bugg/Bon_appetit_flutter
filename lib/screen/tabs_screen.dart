import 'package:flutter/material.dart';
import 'package:meal_app/models/cotogaries.dart';
import 'package:meal_app/screen/fav_screen.dart';
import 'package:meal_app/widget/main_drawer.dart';
import './catogaries_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  final List<Map<String, Object>> _pages = [
    {'page': CatogariesScreen(), 'title': 'Categaries'},
    {'page': FavScreen(), 'title': 'Your Fav'}
  ];
  void selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title'] as String),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: ((context) => AlertDialog(
                          title: Text(
                            '  Copyright \u{00A9} 2023 Aakif',
                            style: TextStyle(fontSize: 18),
                          ),
                        )));
              },
              icon: Icon(Icons.info))
        ],
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectedPage,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categaries'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Fav'),
          ]),
    );
  }
}
