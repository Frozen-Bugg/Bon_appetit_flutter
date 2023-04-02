import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/screen/catogaries_screen.dart';
import 'package:meal_app/routes/routes_const.dart';
import 'package:meal_app/screen/filter_screen.dart';
import 'package:meal_app/screen/meal_detail_screen.dart';
import 'package:meal_app/screen/tabs_screen.dart';
import '../screen/catogeries_meal_screen.dart';

class AppRoutes {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
          name: RoutesName.home,
          path: '/',
          pageBuilder: ((context, state) => MaterialPage(child: TabsScreen()))),
      GoRoute(
          name: RoutesName.meal,
          path: '/catogaries-meal/:title:id',
          pageBuilder: ((context, state) => MaterialPage(
                  child: CatogariesMeal(
                title: state.params['title']!,
                id: state.params['id']!,
              )))),
      GoRoute(
        name: RoutesName.item,
        path: '/meal-item:id',
        pageBuilder: (context, state) {
          return MaterialPage(
              child: MealDetail(
            id: state.params['id']!,
          ));
        },
      ),
      GoRoute(
        path: '/filter-screen',
        name: RoutesName.filter,
        pageBuilder: (context, state) => MaterialPage(child: FilterScreen()),
      ),
    ],
  );
}
