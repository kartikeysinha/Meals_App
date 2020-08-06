import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../Widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals App'),
      ),
      body: GridView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                catData.id,
                catData.title,
                catData.color,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: MediaQuery.of(context).size.width / 25,
          mainAxisSpacing: MediaQuery.of(context).size.height / 50,
        ),
      ),
    );
  }
}
