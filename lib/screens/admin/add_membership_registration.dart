import 'package:flutter/material.dart';

class AddMembershipRegistrations extends StatefulWidget {
  const AddMembershipRegistrations({super.key});

  @override
  State<AddMembershipRegistrations> createState() =>
      _AddMembershipRegistrationsState();
}

class _AddMembershipRegistrationsState
    extends State<AddMembershipRegistrations> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
            "We will add what service was done by which user here and what date."),
      ),
    );
  }
}
