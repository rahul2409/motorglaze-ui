import 'package:flutter/material.dart';

class AddMembership extends StatefulWidget {
  const AddMembership({super.key});

  @override
  State<AddMembership> createState() => _AddMembershipState();
}

class _AddMembershipState extends State<AddMembership> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("We will add a new membership here."),
      ),
    );
  }
}
