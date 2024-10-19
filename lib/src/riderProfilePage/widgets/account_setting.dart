import 'package:flutter/material.dart';

import '../../../core/common/widgets/default_text.dart';

class AccountSettings extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;

  const AccountSettings({
    super.key, required this.icon,
    required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Image.asset(icon),
              SizedBox(width: 20,),
              Text(text),
            ],
          ),
        ),
        Icon(Icons.arrow_forward_ios, size: 16,)
      ],
    );
  }
}
