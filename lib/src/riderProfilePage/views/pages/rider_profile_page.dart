import 'package:flutter/material.dart';

import '../../../../core/common/widgets/default_text.dart';
import '../../../../core/res/app_strings.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media.dart';
import '../../widgets/account_setting.dart';
import '../../widgets/action_text.dart';
import '../../widgets/rider_profile_details.dart';

class RiderProfilePage extends StatelessWidget {
  const RiderProfilePage({super.key});
  static const path='/profile';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
          child: Column(
            children: [
              buildRiderHeader(),
              const RiderProfileDetails(),
              const SizedBox(height: 30,),

              Align(alignment: Alignment.bottomLeft,child: DefaultText(AppStrings.accountSettings, fontSize: 18,color: Colours.textColor,)),
              const SizedBox(height: 15,),
              AccountSettings(icon: Media.profileSettingIcon, text: 'Profile Setting', onTap: (){}),
              const SizedBox(height: 15,),
              AccountSettings(icon: Media.lockIcon, text: 'Change password', onTap: (){}),
              const SizedBox(height: 15,),
              AccountSettings(icon: Media.chatIcon, text: 'Chat support', onTap: (){}),
              const SizedBox(height: 50,),
              Image.asset(Media.lineIcon),

              const SizedBox(height: 10,),

              ActionText(icon: Media.logoutIcon, text: 'Logout'),
              ActionText(icon: Media.shieldIcon, text: AppStrings.deactivateAccount),


            ],
          ),
        ),
      ),
    );
  }
}


Widget buildRiderHeader(){
  return  Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: Row(
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
            padding:  EdgeInsets.all(8.0),
            child: Image.asset(Media.menuIcon),
          ),
        ),
        const SizedBox(width:90),
         DefaultText(AppStrings.profile, fontSize: 18,fontWeight: FontWeight.w300, color: Colours.blackColor,)

      ],
    ),
  );

}
