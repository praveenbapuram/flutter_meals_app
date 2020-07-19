import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
/*  final String tittle;
  final String id;

  const CategoryMealsScreen({Key key, this.tittle, this.id}) : super(key: key);*/
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    String title = routeArgs['title'];
    String id = routeArgs['id'];
    return Scaffold(
        appBar: AppBar(
          title: Text('The Recipies'),
        ),
        body: Center(
          child: Text(
            'The Recipeis of the Category ' + title + ' ' + id,
          ),
        ));
  }
}
