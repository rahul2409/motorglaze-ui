import 'package:flutter/material.dart';
import 'package:memberships_ui/widget/drawer_menu_widget.dart';

class MembershipScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  const MembershipScreen({required this.openDrawer, super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  @override
  Widget build(BuildContext context) {
    VoidCallback openDrawer = widget.openDrawer;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: DrawerMenuWidget(onClick: openDrawer),
        backgroundColor: Colors.transparent,
        title: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
