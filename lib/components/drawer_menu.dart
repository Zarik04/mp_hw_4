import 'package:flutter/material.dart';
import 'package:mb_hw4/components/drawer_menu_item.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Text(
              'Drawer Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          DrawerMenuItem(
              leadingIcon: Icons.home_rounded,
              title: 'First Page',
              namedRoute: 'first'),
          DrawerMenuItem(
              leadingIcon: Icons.list_alt_rounded,
              title: 'Second Page',
              namedRoute: 'second'),
        ],
      ),
    );
  }
}
