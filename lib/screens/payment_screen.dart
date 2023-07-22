import 'package:flutter/material.dart';
import 'package:memberships_ui/widget/drawer_menu_widget.dart';

class PaymentScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  const PaymentScreen({required this.openDrawer, super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    VoidCallback openDrawer = widget.openDrawer;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: DrawerMenuWidget(onClick: openDrawer),
        backgroundColor: Colors.transparent,
        title: Text(
          'Payments',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
