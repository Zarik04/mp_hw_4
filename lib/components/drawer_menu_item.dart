import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String namedRoute;

  const DrawerMenuItem(
      {super.key,
      required this.leadingIcon,
      required this.title,
      required this.namedRoute});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon),
      title: Text(
        title,
      ),
      onTap: () {
        Navigator.pushNamed(context, namedRoute);
      },
    );
  }
}
