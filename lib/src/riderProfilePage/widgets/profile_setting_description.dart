import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/colours.dart';
import 'package:logistics_app/core/res/media.dart';

class ProfileSettingsDescription extends StatelessWidget {
  const ProfileSettingsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(Media.arrowLeftIcon),
        const SizedBox(height: 20,),
        const DefaultText('Profile Setting',color: Colours.blackColor,fontSize: 18,),
        const SizedBox(height: 10,),
        const DefaultText('Modify your details',color: Colours.textColor,fontSize: 16, )
      ],
    );
  }
}
