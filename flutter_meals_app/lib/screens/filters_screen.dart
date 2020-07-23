import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = '/filters';

  final Function saveFilter;
  Map<String, bool> _currentfilters;
  FiltersScreen(this._currentfilters, this.saveFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetrian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  initState() {
    _glutenFree = widget._currentfilters['gluten'];
    _vegetrian = widget._currentfilters['vegetarian'];
    _vegan = widget._currentfilters['vegan'];
    _lactoseFree = widget._currentfilters['lactose'];
    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool cuttentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: cuttentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              Map<String, bool> _filters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetrian,
              };
              widget.saveFilter(_filters);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  'Glutin Free',
                  'Only include glutin-free meals.',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Lactose Free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Vegeterian',
                  'Only include Vegetarian meals.',
                  _vegetrian,
                  (newValue) {
                    setState(
                      () {
                        _vegetrian = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Only include Vegan meals.',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
