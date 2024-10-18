import 'package:flutter/material.dart';
import 'package:meals/Models/category.dart';
import 'package:meals/Models/meal.dart';
import 'package:meals/Screens/MealsViewer.dart';

class Categorycontainer extends StatelessWidget {
  const Categorycontainer({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHight = MediaQuery.of(context).size.height;

    return InkWell(
      radius: 20,
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) =>
                Mealsviewer(title: category.title, category: category),
          ),
        );
      },
      onLongPress: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Just Tab to enter ${category.title}"),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all((screenHight / screenWidth) * 8),
        padding: EdgeInsets.all((screenHight / screenWidth) * 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.6),
              category.color.withOpacity(0.3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: TextStyle(
            fontSize: (screenHight / screenWidth) * 8,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
