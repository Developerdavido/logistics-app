import 'package:flutter/material.dart';

import '../../../core/common/widgets/default_text.dart';

class ActionText extends StatelessWidget {
  const ActionText({
    super.key,
    required this.icon,
    required this.text,
    this.oalt = false, // Default value for oalt
  });

  final String icon;
  final String text;
  final bool oalt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(icon),
          const SizedBox(width: 20,),
          DefaultText(
            text,
            color: text.trim().toLowerCase() == "deactivate account".toLowerCase() ? Colors.red : Colors.black,
          ),
        ],
      ),
    );
  }
}
