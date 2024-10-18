import 'package:flutter/material.dart';
import 'package:meals/Screens/MealsViewer.dart';
import 'package:meals/Widgets/MainDrawer.dart';
import 'package:meals/Screens/Categories.dart';

class MealsHub extends StatefulWidget {
  @override
  State<MealsHub> createState() => _MealsHubState();
}

class _MealsHubState extends State<MealsHub> {
  int barindex = 0;

  void _tabaction(int index) {
    setState(() {
      barindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String ActivatePageTitle = "Categories";
    Widget ActivePage = const Categories();

    if (barindex == 1) {
      ActivatePageTitle = "Favourites";
      ActivePage = Mealsviewer(
        title: ActivatePageTitle,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(ActivatePageTitle),
      ),
      drawer: MainDrawer(),
      body: ActivePage,
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(color: Colors.red),
        currentIndex: barindex,
        onTap: _tabaction,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
