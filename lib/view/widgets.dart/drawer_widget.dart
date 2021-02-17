import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:meal_app/view/Screens/filter_screen.dart';
import 'package:meal_app/view/Screens/selected_meal_category.dart';
import 'package:meal_app/view/home_screen.dart';

class DrawerWidget extends StatefulWidget {
 

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Cooking Up'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Meals'),
            leading: Icon(Icons.food_bank),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Filters'),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FilterScreen(
                         /*  changeFilters: widget.changeFilters, */
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
