import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/colours.dart';

class RiderName extends StatelessWidget {
  const RiderName({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SizedBox(
      child: DefaultText('Hey Karim,', color: Colours.blackColor,fontWeight: FontWeight.w500,fontSize: 18,),
    );
  }
}
