import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/routes/routes_const.dart';

class MainDrawer extends StatelessWidget {
  Widget ListMaker(IconData icon, String text, void Function() tapHandle) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: tapHandle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Material(
            elevation: 8,
            child: Container(
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Bon Appetit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          ListMaker(Icons.cookie, 'meal', () {
            GoRouter.of(context).replaceNamed(RoutesName.home);
          }),
          ListMaker(Icons.filter, 'Filter', () {
            GoRouter.of(context).replaceNamed(RoutesName.filter);
          }),
        ],
      ),
    );
  }
}
