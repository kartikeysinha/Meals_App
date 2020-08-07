import 'package:flutter/material.dart';

import '../Widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Map<String, bool> currentFilters;
  final Function saveFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
  }

  Widget _buildSwitchListTile(
      String title, String description, bool curValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: curValue,
      subtitle: Text(description),
      onChanged: updateValue,
      activeColor: Colors.brown,
    );
  }

  void _saveSelection() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection",
                style: Theme.of(context).textTheme.title),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  "Gluten Free",
                  "Only show Gluten Free meals",
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  "Vegetarian",
                  "Only show Vegetarian meals",
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "Only show Vegan meals",
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  "Lactose Free",
                  "Only show Lactose Free meals",
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Builder(
            builder: (context) => RaisedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text("Filters Saved!"),
                );
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                Scaffold.of(context).showSnackBar(snackBar);
                widget.saveFilters(selectedFilters);
              },
              color: Theme.of(context).primaryColor,
              child: Text(
                "Save Selection",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
          ),
        ],
      ),
    );
  }
}
