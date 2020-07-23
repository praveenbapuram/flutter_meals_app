import 'package:flutter/material.dart';
import 'package:flutter_meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggle;
  final Function isFavourite;

  const MealDetailScreen({Key key, this.toggle, this.isFavourite})
      : super(key: key);

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildCOntainor(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 300,
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildCOntainor(ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(selectedMeal.ingredients[index])),
                );
              },
              itemCount: selectedMeal.ingredients.length,
            )),
            buildSectionTitle('Steps', context),
            buildCOntainor(ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${(index + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                );
              },
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(isFavourite(mealId) ? Icons.star : Icons.star_border),
          onPressed: () {
            toggle(mealId);
          }),
    );
  }
}
