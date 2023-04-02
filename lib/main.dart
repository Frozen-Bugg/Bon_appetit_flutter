import 'package:flutter/material.dart';
import 'package:meal_app/models/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import './screen/catogaries_screen.dart';
import 'package:meal_app/routes/go_routes.dart';

void main() {
  runApp(const MyApp());
}

class filter {
  static bool glutenfree = false;
  static bool lactosefree = false;
  static bool vegan = false;
  static bool vegeterian = false;
  static List<Meal> availableMeal = DUMMY_MEALS;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bon Appetit',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routeInformationParser: AppRoutes().router.routeInformationParser,
      routerDelegate: AppRoutes().router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Meal App'),
//       ),
//       body: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'Navigation',
//               ),
//             ]),
//       ),
//     );
//   }
// }
