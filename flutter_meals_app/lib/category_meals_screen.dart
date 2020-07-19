import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String tittle;
  final String id;

  const CategoryMealsScreen({Key key, this.tittle, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('The Recipies'),
        ),
        body: Center(
          child: Text(
            'The Recipeis of the Category ' + tittle + ' ' + id,
          ),
        ));
  }
}
