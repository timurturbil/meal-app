import 'package:flutter/material.dart';
import 'package:meal_app/data/meal_data.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:meal_app/view/Screens/favorities.dart';
import 'package:meal_app/view/widgets.dart/drawer_widget.dart';
import 'package:meal_app/view/widgets.dart/gridviewWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(
       /*  changeFilters: widget.changeFilters, */
      ),
      appBar: AppBar(
        title: Text("Categories"),
        backgroundColor: Colors.red[700],
      ),
      body: (_selectedIndex == 0)
          ? GridViewWidget(
              /* availableMeals: widget.availableMeals, */
            )
          : Favorities(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favories',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
