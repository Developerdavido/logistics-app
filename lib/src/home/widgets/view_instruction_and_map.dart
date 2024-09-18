import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/app_strings.dart';
import 'package:logistics_app/core/res/media.dart';

import '../../../core/res/colours.dart';

class ViewInstructionAndMap extends StatelessWidget {
  const ViewInstructionAndMap({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(Media.editSquareIcon),
            const SizedBox(width: 10,),
            const DefaultText(AppStrings.viewInstruction,color: Colours.primary,)
          ],
        ),
        const DefaultText(AppStrings.viewMap, color: Colours.greenColor,)
      ],
    );
  }
}
