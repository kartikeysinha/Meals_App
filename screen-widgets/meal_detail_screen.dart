import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function _toggleFav;
  final Function _isFav;

  MealDetailScreen(this._toggleFav, this._isFav);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child, double c_height) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: c_height,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Color.fromRGBO(220, 220, 220, 1),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
                200),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                  itemBuilder: (ctx, index) => ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                        ),
                      ),
                  itemCount: selectedMeal.steps.length),
              400,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isFav(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => _toggleFav(mealId),
      ),
    );
  }
}
