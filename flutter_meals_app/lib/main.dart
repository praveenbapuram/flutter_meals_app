import 'package:flutter/material.dart';
import 'package:flutter_meals_app/dummy_data.dart';
import 'package:flutter_meals_app/screens/categories_screen.dart';
import 'package:flutter_meals_app/screens/category_meals_screen.dart';
import 'package:flutter_meals_app/screens/filters_screen.dart';
import 'package:flutter_meals_app/screens/meal_details_screen.dart';
import 'package:flutter_meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favourites = [];

  void _toggleFavourite(String mealId) {
    final existingIndex = favourites.indexWhere((meal) {
      return meal.id == mealId;
    });
    print('existing INdex ' + existingIndex.toString());
    if (existingIndex >= 0) {
      setState(() {
        favourites.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favourites.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  setFilter(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool isFavourite(String mealId) {
    print(mealId);
    bool retValue = favourites.any((meal) => meal.id == mealId);
    print('return Value : ' + retValue.toString());
    return retValue;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline5: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline4: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontStyle: FontStyle.italic,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      //home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(
              favouriteMeals: favourites,
            ),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
              toggle: _toggleFavourite,
              isFavourite: isFavourite,
            ),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, setFilter),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/abc') {
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        }
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => MaterialApp());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
