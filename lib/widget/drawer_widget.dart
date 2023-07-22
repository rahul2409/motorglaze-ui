import 'package:flutter/material.dart';
import 'package:memberships_ui/data/drawer_data.dart';
import 'package:memberships_ui/models/drawer_model.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  const DrawerWidget({required this.onSelectedItem, super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.fromLTRB(16, 32, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildDrawerItems(context),
            ],
          ),
        ),
      );
  Widget buildDrawerItems(BuildContext context) => Column(
        children: DrawerItems.all
            .map(
              (item) => ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                leading: Icon(
                  item.icon,
                  color: Colors.white,
                ),
                title: Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () => onSelectedItem(item),
              ),
            )
            .toList(),
      );
}
