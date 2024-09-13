import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/app_strings.dart';
import 'package:logistics_app/core/res/colours.dart';
import 'package:logistics_app/core/res/media.dart';

class ContactReceipt extends StatelessWidget {
  const ContactReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DefaultText(AppStrings.contactReceipt,color: Colours.textColor,fontWeight: FontWeight.w500,),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const DefaultText(AppStrings.contactName),
            Image.asset(Media.telephoneIcon)
          ],
        )
      ],
    );
  }
}
