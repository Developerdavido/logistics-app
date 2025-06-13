import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/colours.dart';

class RiderName extends StatelessWidget {
  const RiderName({super.key, this.name});

  final String? name;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: DefaultText('Hey $name,', color: Colours.blackColor,fontWeight: FontWeight.w500,fontSize: 18,),
    );
  }
}
