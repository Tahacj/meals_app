import 'package:flutter/material.dart';

import '../widget/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final medqry = MediaQuery.of(context);
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(20),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                  catData.Id,
                  catData.title,
                  catData.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: medqry.size.width / 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
