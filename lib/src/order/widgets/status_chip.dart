import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final String status;

  const StatusChip({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;
    if (status == 'Delivered') {
      color = Colors.green;
    } else if (status == 'In progress') {
      color = Colors.orange;
    } else {
      color = Colors.red;
    }

    return Chip(
      label: Text(status),
      backgroundColor: color,
      labelStyle: TextStyle(color: Colors.white),
    );
  }
}
