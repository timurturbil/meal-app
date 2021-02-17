import 'package:flutter/material.dart';
import 'package:meal_app/provider/user_provider.dart';
import 'package:meal_app/view/widgets.dart/drawer_widget.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Items>(context);
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                product.deleteAvailableFilteredMeals();
                product.changeFilters(
                    isGlutenFree, isVegan, isVegetarian, isLactoseFree);
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Text("Adjust Your Meal Selection"),
          ListTile(
            title: Text("Gluten-free"),
            subtitle: Text("Only includes gluten free meals"),
            trailing: Switch(
              activeColor: Theme.of(context).accentColor,
              value: isGlutenFree,
              onChanged: (val) {
                setState(() {
                  isGlutenFree = val;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Lactose-free"),
            subtitle: Text("Only includes lactose free meals"),
            trailing: Switch(
              activeColor: Theme.of(context).accentColor,
              value: isVegan,
              onChanged: (val) {
                setState(() {
                  isVegan = val;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Vegeterian"),
            subtitle: Text("Only includes Vegeterian meals"),
            trailing: Switch(
              activeColor: Theme.of(context).accentColor,
              value: isVegetarian,
              onChanged: (val) {
                setState(() {
                  isVegetarian = val;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Vegan"),
            subtitle: Text("Only includes Vegan meals"),
            trailing: Switch(
              activeColor: Theme.of(context).accentColor,
              value: isLactoseFree,
              onChanged: (val) {
                setState(() {
                  isLactoseFree = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
