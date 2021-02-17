import 'package:flutter/material.dart';
import 'package:meal_app/data/meal_data.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:meal_app/provider/user_provider.dart';
import 'package:meal_app/view/Screens/selected_meal_category.dart';
import 'package:provider/provider.dart';

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Items>(context);
    
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (3 / 2),
              ),
              itemCount: product.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("${product.categories[index].title}"),
                    tileColor: product.categories[index].color,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectedMealCategory(
                                  categoryName: product.categories[index].title,
                                  categoryId: product.categories[index].id,
                                  listOfMeals: product.getAvailableFilteredMeals,
                                )),
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
/* 
Container(
                    child: Card(
                      margin: EdgeInsets.all(10),
                      color: DUMMY_CATEGORIES[index].color,
                      child: Center(
                        child: Text('${DUMMY_CATEGORIES[index].title}'),
                      ),
                    ),
                  ); */
