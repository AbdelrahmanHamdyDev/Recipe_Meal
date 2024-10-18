import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/Models/meal.dart';
import 'package:meals/Providers/Favourites_provider.dart';
import 'package:meals/Widgets/Info_Parts.dart';

class Mealinfo extends ConsumerWidget {
  Mealinfo({super.key, required this.meal});

  final Meal meal;

  bool IsFavourite = false;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;
    final IsFavourite = ref.watch(FavouriteMeal).contains(meal);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            pinned: true,
            actions: [
              IconButton(
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) => RotationTransition(
                    turns: animation,
                    child: child,
                  ),
                  child: Icon(
                    (IsFavourite) ? Icons.star : Icons.star_border,
                    color: Colors.white,
                    key: ValueKey(IsFavourite),
                  ),
                ),
                onPressed: () {
                  bool IsAdded = ref
                      .read(FavouriteMeal.notifier)
                      .toggleFavoritesMeals(meal);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        (IsAdded)
                            ? "Added Successfully"
                            : "Removed Successfully",
                      ),
                      duration: const Duration(milliseconds: 200),
                    ),
                  );
                },
              ),
            ],
            expandedHeight: screenheight / 3,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                color: Colors.black.withOpacity(0.3),
                child: Text(
                  meal.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (screenheight / screenWidth) * 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              background: Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
                  colorBlendMode: BlendMode.darken,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all((screenheight / screenWidth) * 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoContainers(
                          title: "Ingeredients", points: meal.ingredients),
                      InfoContainers(title: "Steps", points: meal.steps),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
