import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/app_strings.dart';
import 'package:logistics_app/core/res/colours.dart';
import 'package:logistics_app/core/res/media.dart';

class RiderProfileDetails extends StatelessWidget {
  const RiderProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: Column(
          children: [
            Image.asset(Media.defaultAvatar, fit: BoxFit.cover, width: 80, height: 80,),
            SizedBox(height: 10,),
            DefaultText(AppStrings.profileName,color: Colours.blackColor, fontWeight: FontWeight.w700,fontSize: 20,),
            DefaultText(AppStrings.telephoneNumber,color: Colours.textColor, fontSize: 16,)
          ],
        ),
      ),
    );
  }
}
