import 'package:flutter/material.dart';
import 'package:meal_app/data/meal_data.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:meal_app/view/Screens/detailedMeals.dart';

class SelectedMealCategory extends StatefulWidget {
  final String categoryName;
  final String categoryId;
  final List<Meal> listOfMeals;
  const SelectedMealCategory({
    Key key,
    this.categoryName,
    this.categoryId, this.listOfMeals,
  }) : super(key: key);
  @override
  _SelectedMealCategoryState createState() => _SelectedMealCategoryState();
}

class _SelectedMealCategoryState extends State<SelectedMealCategory> {
  List meals = [];

  void _selectedMeal() {
    for (int i = 0; i < widget.listOfMeals.length; i++) {
      if (widget.listOfMeals[i].categories.contains('${widget.categoryId}')) {
        meals.add(widget.listOfMeals[i]);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedMeal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.categoryName}"),
      ),
      body: new GridView.count(
        crossAxisCount: 1,
        children: new List.generate(meals.length, (index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeteailedMeals(
                              meals: meals,
                              index: index,
                            )),
                  );
                },
                child: Column(
                  children: [
                    Text("${meals[index].title}"),
                    Image.network("${meals[index].imageUrl}"),
                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.lock_clock), onPressed: () {}),
                        Text("${meals[index].duration}"),
                        IconButton(icon: Icon(Icons.badge), onPressed: () {}),
                        Text("bb"),
                        IconButton(
                            icon: Icon(Icons.attach_money), onPressed: () {}),
                        Text("bb"),
                      ],
                    )
                  ],
                )),
          );
        }),
      ),
    );
  }
}
