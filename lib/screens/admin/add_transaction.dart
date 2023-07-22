import 'package:flutter/material.dart';

class RecordTransaction extends StatefulWidget {
  const RecordTransaction({super.key});

  @override
  State<RecordTransaction> createState() => _RecordTransactionState();
}

class _RecordTransactionState extends State<RecordTransaction> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
            "This will be used to settle the amount which we receive and we have to pay to the store."),
      ),
    );
  }
}
