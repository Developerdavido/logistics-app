import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/colours.dart';

class SendOrder extends StatelessWidget {
  const SendOrder({super.key, required this.sending, required this.quantity});
  final String sending;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(color: Colours.textColor,height: 0.3,),
          const SizedBox(height: 13,),
          DefaultText(sending, color: Colours.textColor,),
          const SizedBox(height: 10,),
          DefaultText('Document $quantity', color: Colours.blackColor, fontWeight: FontWeight.bold,)
        ],
      ),
    );
  }
}
