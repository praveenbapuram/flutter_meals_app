import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/category_item.dart';

import 'package:flutter_meals_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      children: DUMMY_CATEGORIES.map((catItem) {
        return CategoryItem(
            id: catItem.id, title: catItem.title, color: catItem.color);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
