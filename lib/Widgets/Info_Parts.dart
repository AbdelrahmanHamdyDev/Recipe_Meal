import 'package:flutter/material.dart';

class InfoContainers extends StatelessWidget {
  const InfoContainers({
    super.key,
    required this.title,
    required this.points,
  });

  final String title;
  final List<String> points;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title :",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: (screenheight / screenWidth) * 11,
          ),
        ),
        Padding(
          padding: EdgeInsets.all((screenheight / screenWidth) * 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (String i in points)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenheight / 250),
                  child: Text(
                    (title == "Steps") ? "• $i" : "- $i",
                    style: TextStyle(
                      fontSize: (screenheight / screenWidth) * 8,
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: screenheight / 100),
      ],
    );
  }
}
