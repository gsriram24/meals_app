import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;

  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String description, bool val, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: val,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactose': _lactoseFree,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection.',
                style: Theme.of(context).textTheme.title),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten Free',
                  'Only include Gluten Free Meals',
                  _glutenFree,
                  (val) => setState(
                    () {
                      _glutenFree = val;
                    },
                  ),
                ),
                _buildSwitchListTile(
                  'Lactose Free',
                  'Only include Lactose Free Meals',
                  _lactoseFree,
                  (val) => setState(
                    () {
                      _lactoseFree = val;
                    },
                  ),
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include Vegan Meals',
                  _vegan,
                  (val) => setState(
                    () {
                      _vegan = val;
                    },
                  ),
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include Vegetarian Meals',
                  _vegetarian,
                  (val) => setState(
                    () {
                      _vegetarian = val;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
