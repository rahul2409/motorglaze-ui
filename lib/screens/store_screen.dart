import 'package:flutter/material.dart';
import 'package:memberships_ui/widget/drawer_menu_widget.dart';

class StoreScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  const StoreScreen({required this.openDrawer, super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    VoidCallback openDrawer = widget.openDrawer;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: DrawerMenuWidget(onClick: openDrawer),
        backgroundColor: Colors.transparent,
        title: Text(
          'Store',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
