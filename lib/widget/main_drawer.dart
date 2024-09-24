import 'package:flutter/material.dart';

import '../screens/Info_screen.dart';
import '../screens/filters_screen.dart';

class MinDrawer extends StatelessWidget {
  Widget _draweritem(
      BuildContext context, IconData icon, String title, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              "De Khellos!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.pink),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _draweritem(
            context,
            Icons.restaurant,
            "Meals",
            () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          _draweritem(
            context,
            Icons.settings,
            "Filters",
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routName);
            },
          ),
          _draweritem(
            context,
            Icons.info_outline,
            "Info",
            () {
              Navigator.of(context).pushReplacementNamed(InfoScreen.routName);
            },
          ),
        ],
      ),
    );
  }
}
