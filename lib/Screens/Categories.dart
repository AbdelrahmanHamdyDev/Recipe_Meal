import 'package:flutter/material.dart';
import 'package:meals/Data/dummy_data.dart';
import 'package:meals/Models/category.dart';
import 'package:meals/Widgets/Category_GridItems.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          for (Category cat in availableCategories)
            Categorycontainer(category: cat),
        ]);
  }
}
