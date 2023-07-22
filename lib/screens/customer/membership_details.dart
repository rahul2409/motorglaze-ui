import 'package:flutter/material.dart';

class MembershipDetails extends StatefulWidget {
  const MembershipDetails({super.key});

  @override
  State<MembershipDetails> createState() => _MembershipDetailsState();
}

class _MembershipDetailsState extends State<MembershipDetails> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Place for a user to check his membership details."),
      ),
    );
  }
}
