import 'package:flutter/material.dart';
import 'package:meal_app/provider/user_provider.dart';
import 'package:meal_app/view/Screens/favorities.dart';
import 'package:provider/provider.dart';

class DeteailedMeals extends StatelessWidget {
  final List meals;
  final int index;
  const DeteailedMeals({Key key, this.meals, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Items>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          product.favoriteMeal(meals, index);
        },
        child: Icon(Icons.star),
        backgroundColor: Colors.green,
      ),
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        title: Text("${meals[index].title}"),
      ),
      body: Column(
        children: <Widget>[
          Image.network('${meals[index].imageUrl}'),
          Text("Ingredients"),
          SingleChildScrollView(
            child: Container(
              width: 300,
              height: 150,
              child: Card(
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                            itemCount: meals[index].ingredients.length,
                            itemBuilder: (context, index2) {
                              return Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                child: Text(
                                  "${meals[index].ingredients[index2]}",
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
