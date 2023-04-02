import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/routes/routes_const.dart';
import '../screen/catogaries_screen.dart';

class CatogariesItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CatogariesItem(this.title, this.color, this.id);

  // void selectCatogaries(BuildContext ctx) {
  //   Navigator.of(ctx)
  //       .pushNamed('/catogaries-meal', arguments: {'title': title});
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).pushNamed(RoutesName.meal, params: {
          'title': title,
          'id': id,
        });
      },
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: Material(
        elevation: 8,
        child: Container(
          child: Center(child: Text(title)),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.3), color.withOpacity(0.5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
