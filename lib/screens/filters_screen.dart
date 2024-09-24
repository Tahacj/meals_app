import 'package:flutter/material.dart';

import '../widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = "/filters";

  final Function saveFilters;
  final Map<String, bool> currentfilters;

  FiltersScreen(this.currentfilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vagetarian = false;
  bool _vegan = false;
  bool _lactosFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentfilters["gluten"]!;
    _lactosFree = widget.currentfilters["lactose"]!;
    _vagetarian = widget.currentfilters["vegaterian"]!;
    _vegan = widget.currentfilters["vegan"]!;
    super.initState();
  }

  Widget _filterSwitshes(
    String title,
    String subTitle,
    bool filterdby,
    Function updateValue,
  ) {
    return SwitchListTile(
      value: filterdby,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY Filters"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final selectedFilters = {
                "gluten": _glutenFree,
                "lactose": _lactosFree,
                "vegaterian": _vagetarian,
                "vegan": _vegan,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MinDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Ajust your Meal selection.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _filterSwitshes(
                "Gluten Free",
                "Shows only the Gluten Free Meals",
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _filterSwitshes(
                "Vegaterian",
                "Shows only the Vegaterian Meals",
                _vagetarian,
                (newValue) {
                  setState(() {
                    _vagetarian = newValue;
                  });
                },
              ),
              _filterSwitshes(
                "Vegan",
                "Shows only the Vegan Meals",
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              _filterSwitshes(
                "Lactos Free",
                "Shows only the Lactos Free Meals",
                _lactosFree,
                (newValue) {
                  setState(() {
                    _lactosFree = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
