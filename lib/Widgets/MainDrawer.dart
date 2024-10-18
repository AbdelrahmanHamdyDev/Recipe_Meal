import 'package:flutter/material.dart';
import 'package:meals/Screens/Settings.dart';
import 'package:meals/Widgets/Drawer_items.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.secondaryContainer,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.food_bank_rounded,
                    size: (screenheight / screenWidth) * 30,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  SizedBox(width: screenWidth / 80),
                  Text(
                    "Let him cook !",
                    style: TextStyle(
                        fontSize: (screenheight / screenWidth) * 11,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                ],
              ),
            ),
            DrawerItems(
              title: "Setting",
              icon: Icon(
                Icons.settings,
                size: (screenheight / screenWidth) * 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
