import 'package:flutter/material.dart';
import 'package:memberships_ui/widget/drawer_menu_widget.dart';

class ProfileScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  const ProfileScreen({required this.openDrawer, super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    VoidCallback openDrawer = widget.openDrawer;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: DrawerMenuWidget(onClick: openDrawer),
        backgroundColor: Colors.transparent,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
