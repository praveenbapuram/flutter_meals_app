import 'package:flutter/material.dart';
import 'package:flutter_meals_app/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  const CategoryItem({Key key, this.id, this.title, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
