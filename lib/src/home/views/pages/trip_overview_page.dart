import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/customize_button.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/app_strings.dart';
import 'package:logistics_app/core/res/media.dart';
import 'package:logistics_app/src/home/views/pages/trip_details_page.dart';
import 'package:logistics_app/src/home/widgets/delivery_mode.dart';
import 'package:logistics_app/src/home/widgets/on_and_off_switch_button.dart';
import 'package:logistics_app/src/home/widgets/order_information.dart';
import 'package:logistics_app/src/home/widgets/rider_home_header.dart';
import 'package:logistics_app/src/home/widgets/rider_name.dart';
import 'package:logistics_app/src/home/widgets/send_order.dart';

import '../../../../core/res/colours.dart';

class TripOverviewPage extends StatelessWidget {
  const TripOverviewPage({super.key});

  static const path='/trip_overview';

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
               const RiderHomeHeader(),
               const SizedBox(height: 30,),
               const Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   RiderName(),
                   OnAndOffSwitchButton(),
                 ],
               ),
              const SizedBox(height: 20,),
              const OrderInformation(
                  orderType: AppStrings.openOrder,
                  tripType: AppStrings.tripTypeText,
                  username: AppStrings.userNameText,
                  role: AppStrings.roleText,
                  showTelephoneIcon: false,
                  userImage: AssetImage(Media.defaultAvatar)),
              const SizedBox(height: 20,),
              const DeliveryMode(deliveryType: AppStrings.pickUp, address: AppStrings.addressForDelivery),
              const SizedBox(height: 10,),
              Image.asset(Media.arrowDownIcon),
              const SizedBox(height: 10,),

              const DeliveryMode(deliveryType: AppStrings.delivery, address: AppStrings.addressForDelivery),
              const SizedBox(height: 30,),
              const SendOrder(sending: AppStrings.sendingText, quantity: AppStrings.deliveryWeight),
              const SizedBox(height: 20,),
              CustomizeButton(
                text: AppStrings.acceptOrder,
                onTap: (){
                  Navigator.pushNamed(context, TripDetailsPage.path);
                },width: double.infinity,borderRadius: 20,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              const SizedBox(height: 10,),

              Center(
                child: TextButton(
                    onPressed: (){},
                    child: const DefaultText(
                      AppStrings.declineOrder,
                      color: Colours.primary,
                      fontWeight: FontWeight.w400,)),
              )

            ]
          ),
        )
      ),
    );
  }
}
