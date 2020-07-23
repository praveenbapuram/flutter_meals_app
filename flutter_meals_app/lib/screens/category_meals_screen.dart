import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  var loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      String categoryTitle = routeArgs['title'];
      String id = routeArgs['id'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
    }
    loadedInitData = true;
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Recipies'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
