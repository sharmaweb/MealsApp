import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Function favoriteToggler;
  final Function isFavorite;
  CategoryDetailScreen(this.favoriteToggler, this.isFavorite);
  static const routeName = '/category-deatails';
  Widget buildSectionTItle(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Center(
          child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      )),
    );
  }

  Widget buildSectionContainer(Widget widget) {
    return Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        height: 200,
        width: 350,
        child: widget);
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final categorymeal = DUMMY_MEALS.firstWhere(
        (meal) => meal.id == mealid); //to get the element with a specific id;
    return Scaffold(
      appBar: AppBar(
        title: Text(categorymeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: Colors.black54,
              height: 300,
              width: double.infinity,
              child: CircleAvatar(
                backgroundImage: NetworkImage(categorymeal.imageUrl),
                radius: 200,
                // child: ClipRRect(
                // borderRadius: BorderRadius.circular(20),
                // child: Image.network(categorymeal.imageUrl)),
              ),
            ),
            // ),
            buildSectionTItle(context, 'Ingredients:'),
            buildSectionContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(categorymeal.ingredients[index])),
                ),
                itemCount: categorymeal.ingredients.length,
              ),
            ),
            buildSectionTItle(context, 'Steps:'),
            buildSectionContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(categorymeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: categorymeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavorite(mealid) ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed:()=> favoriteToggler(mealid),
      ),
    );
  }
}
