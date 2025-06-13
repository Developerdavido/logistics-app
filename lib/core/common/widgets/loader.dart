import 'package:flutter/material.dart';
import 'package:logistics_app/core/res/colours.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: 80,
        child: const CircularProgressIndicator(
          strokeWidth: 1.5,
          color: Colours.primary,
        ),
      ),
    );
  }
}
