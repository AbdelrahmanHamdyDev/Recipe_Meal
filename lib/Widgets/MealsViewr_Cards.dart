import 'package:flutter/material.dart';
import 'package:meals/Models/meal.dart';
import 'package:meals/Screens/MealInfo.dart';

var complexityIcons = {
  Complexity.simple: Icons.sentiment_satisfied_alt,
  Complexity.challenging: Icons.sentiment_satisfied,
  Complexity.hard: Icons.sentiment_very_dissatisfied,
};

var affordabilityIcons = {
  Affordability.affordable: Icons.money_off,
  Affordability.pricey: Icons.attach_money,
  Affordability.luxurious: Icons.diamond,
};

class MealsviewrGrid extends StatelessWidget {
  const MealsviewrGrid({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;

    

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => Mealinfo(meal: meal),
            ),
          );
        },
        child: SizedBox(
          width: double.infinity,
          height: screenheight / 4,
          child: Stack(
            children: [
              Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
                  colorBlendMode: BlendMode.darken,
                  errorBuilder: (ctx, exc, stackrace) => Image.asset(
                    "assets/images/fallback.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                    color:
                        Theme.of(context).colorScheme.surface.withOpacity(0.3),
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.6),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.all((screenheight / screenWidth) * 2),
                        child: Text(
                          meal.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: (screenheight / screenWidth) * 9,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth / 10,
                          vertical: screenheight / 600,
                        ),
                        child: Row(
                          children: [
                            Icon(complexityIcons[meal.complexity]),
                            SizedBox(width: screenWidth / 100),
                            Text(meal.complexity.name),
                            const Spacer(),
                            Icon(
                              affordabilityIcons[meal.affordability],
                            ),
                            SizedBox(width: screenWidth / 100),
                            Text(meal.affordability.name),
                            const Spacer(),
                            const Icon(Icons.alarm),
                            SizedBox(width: screenWidth / 100),
                            Text(
                              "${meal.duration.toString()} min",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
