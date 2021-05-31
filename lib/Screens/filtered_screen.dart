import 'package:MealsApp/Widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import '../Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Function saveFilter;
  final Map<String , bool> currentFilter;
  
  FiltersScreen(this.currentFilter,this.saveFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutonFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
 @override
    initState(){
      _glutonFree= widget.currentFilter['gluten'];       ///So that the choosen filter is made the current state.
      _lactoseFree= widget.currentFilter['lactose'];
      _vegetarian= widget.currentFilter['vegetarian'];
      _vegan= widget.currentFilter['vegan'];
      super.initState();
    }

  Widget buildSwitchTile(
      String title, String subtitle, bool currentValue, Function upadateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: upadateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The filtered content'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutonFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilter(selectedFilters);
            },
          ) // Since save filter is in the widget and not in the state.
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchTile(
                'Gluton-free',
                'Only include GLuten-free meals.',
                _glutonFree,
                (newValue) {
                  setState(() {
                    _glutonFree = newValue;
                  });
                },
              ),
              buildSwitchTile(
                'Lactose-free',
                'Only include Lactose-free meals.',
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              buildSwitchTile(
                'Vegetarian',
                'Only include Vegetarian meals.',
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              buildSwitchTile(
                'Vegan',
                'Only include Vegan meals.',
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
