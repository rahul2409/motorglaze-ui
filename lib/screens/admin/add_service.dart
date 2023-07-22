import 'package:flutter/material.dart';

class AddServicesMembership extends StatefulWidget {
  const AddServicesMembership({super.key});

  @override
  State<AddServicesMembership> createState() => _AddServicesMembershipState();
}

class _AddServicesMembershipState extends State<AddServicesMembership> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
            "Add Services which will be reflected to the membership here."),
      ),
    );
  }
}
