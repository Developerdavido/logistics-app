import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/app_strings.dart';
import 'package:logistics_app/core/res/media.dart';

import '../../../core/res/colours.dart';

class RiderHomeHeader extends StatelessWidget {
  const RiderHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colours.whiteColor,
            borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset:  const Offset(0,0),
                )
              ]

          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Media.menuIcon),
          ),
        ),
        const SizedBox(width: 50,),
        const DefaultText(AppStrings.home, fontSize: 20,fontWeight: FontWeight.w500, color: Colours.blackColor,)

      ],
    );
  }
}
