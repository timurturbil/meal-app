import 'package:flutter/material.dart';
import 'package:meal_app/data/meal_data.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:meal_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import './view/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Items(),
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}


/* import 'package:flutter/material.dart';
import 'package:meal_app/data/meal_data.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:meal_app/provider/user_provider.dart';
import 'package:meal_app/view/Screens/detailedMeals.dart';
import 'package:provider/provider.dart';

class SelectedMealCategory extends StatelessWidget {
  final String categoryName;
  final String categoryId;

  const SelectedMealCategory({
    Key key,
    @required this.categoryName,
    @required this.categoryId,
  }): super(key: key);

  Widget build(BuildContext context) {
    final product = Provider.of<Items>(context);
    return WillPopScope(
        onWillPop: () async {
          product.deleteList();
          print("${product.secilenListe}");

          Navigator.of(context).pop(true);
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("$categoryName"),
          ),
          body: new GridView.count(
            crossAxisCount: 1,
            children: new List.generate(product.secilenListe.length, (index) {
              return Card(
                margin: EdgeInsets.all(10),
                child: new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeteailedMeals(
                                  meals: product.secilenListe,
                                  index: index,
                                )),
                      );
                    },
                    child: Column(
                      children: [
                        Text("${product.secilenListe[index].title}"),
                        Image.network(
                            "${product.secilenListe[index].imageUrl}"),
                        Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.lock_clock), onPressed: () {}),
                            Text("${product.secilenListe[index].duration}"),
                            IconButton(
                                icon: Icon(Icons.badge), onPressed: () {}),
                            Text("bb"),
                            IconButton(
                                icon: Icon(Icons.attach_money),
                                onPressed: () {}),
                            Text("bb"),
                          ],
                        )
                      ],
                    )),
              );
            }),
          ),
        ));
  }
}
 */