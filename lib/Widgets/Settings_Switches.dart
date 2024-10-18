import 'package:flutter/material.dart';

class SettingListtile extends StatelessWidget {
  SettingListtile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.SwitchValue,
    required this.triggerSwitch,
  });

  final String title;
  final String subtitle;
  bool SwitchValue;
  final Function(bool) triggerSwitch;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenheight / 100),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: (screenheight / screenWidth) * 10),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              fontSize: (screenheight / screenWidth) * 6,
              fontWeight: FontWeight.w200),
        ),
        trailing: Switch(
          value: SwitchValue,
          onChanged: triggerSwitch,
        ),
      ),
    );
  }
}
