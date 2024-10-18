import 'package:flutter/material.dart';
import 'package:meals/Screens/Settings.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({super.key, required this.title, required this.icon});

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;

    return InkWell(
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
            fontSize: (screenheight / screenWidth) * 8,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => settings(),
          ),
        );
      },
    );
  }
}
