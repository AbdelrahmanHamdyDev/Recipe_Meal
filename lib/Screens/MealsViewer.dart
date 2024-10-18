import 'package:flutter/material.dart';
import 'package:meals/Models/category.dart';
import 'package:meals/Models/meal.dart';
import 'package:meals/Providers/FiltereMeals_Providers.dart';
import 'package:meals/Widgets/MealsViewr_Cards.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Providers/Favourites_provider.dart';

class Mealsviewer extends ConsumerWidget {
  const Mealsviewer({super.key, required this.title, this.category});

  final String title;
  final Category? category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHight = MediaQuery.of(context).size.height;

    String EmptyMealsTitle = (title == "Favourites")
        ? "Hmmm... \n Try Add Some Meals As Favourites"
        : "There's No Meals Here";

    List<Meal> meals = (title == "Favourites")
        ? ref.watch(FavouriteMeal)
        : ref.watch(FilterMeals);

    if (title != "Favourites" && category != null) {
      meals = meals.where((m) => m.categories.contains(category!.id)).toList();
    }

    return Scaffold(
      appBar: (title == "Favourites")
          ? null
          : AppBar(
              title: Text(title),
            ),
      body: (meals.isEmpty)
          ? Center(
              child: Text(
                EmptyMealsTitle,
                style: TextStyle(fontSize: (screenHight / screenWidth) * 8),
              ),
            )
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (cnx, indx) => MealsviewrGrid(
                meal: meals[indx],
              ),
            ),
    );
  }
}
