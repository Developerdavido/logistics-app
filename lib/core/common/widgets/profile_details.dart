import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/colours.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key, required this.main, required this.sub});
  final String main;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(main, fontSize: 18,color: Colours.blackColor,fontWeight: FontWeight.w500,),
        const SizedBox(height: 8,),
        DefaultText(sub, fontSize: 15,color: Colours.textColor,)
      ],
    );
  }
}
