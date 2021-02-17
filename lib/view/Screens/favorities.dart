import 'package:flutter/material.dart';
import 'package:meal_app/provider/user_provider.dart';
import 'package:meal_app/view/Screens/detailedMeals.dart';
import 'package:provider/provider.dart';

class Favorities extends StatefulWidget {
  @override
  _FavoritiesState createState() => _FavoritiesState();
}

class _FavoritiesState extends State<Favorities> {
  Widget build(BuildContext context) {
    final product = Provider.of<Items>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites Meals"),
      ),
      body: new GridView.count(
        crossAxisCount: 1,
        children: new List.generate(product.getfavoritesMeals.length, (index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeteailedMeals(
                              meals: product.getfavoritesMeals,
                              index: index,
                            )),
                  );
                },
                child: Column(
                  children: [
                    Text("${product.getfavoritesMeals[index].title}"),
                    Image.network("${product.getfavoritesMeals[index].imageUrl}"),
                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.lock_clock), onPressed: () {}),
                        Text("${product.getfavoritesMeals[index].duration}"),
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
