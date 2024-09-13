import 'package:flutter/material.dart';
import 'package:logistics_app/src/home/views/pages/trip_details_page.dart';

import '../../../../core/common/widgets/customize_button.dart';
import '../../../../core/res/app_strings.dart';
import '../../../../core/res/media.dart';
import '../../widgets/contact_receipt.dart';
import '../../widgets/delivery_mode.dart';
import '../../widgets/on_and_off_switch_button.dart';
import '../../widgets/order_information.dart';
import '../../widgets/rider_home_header.dart';
import '../../widgets/rider_name.dart';
import '../../widgets/send_order.dart';
import '../../widgets/view_instruction_and_map.dart';

class CompleteDeliveryPage extends StatelessWidget {
  const CompleteDeliveryPage({super.key});
  static const path='/complete_delivery';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      orderType: AppStrings.newOrder,
                      tripType: AppStrings.tripTypeText,
                      username: AppStrings.userNameText,
                      role: AppStrings.roleText,
                      userImage: AssetImage(Media.defaultAvatar)),

                  const SizedBox(height: 20,),

                  const DeliveryMode(deliveryType: AppStrings.pickUp, address: AppStrings.addressForDelivery),
                  const SizedBox(height: 10,),
                  Image.asset(Media.arrowDownIcon),
                  const SizedBox(height: 10,),

                  const DeliveryMode(deliveryType: AppStrings.delivery, address: AppStrings.addressForDelivery),

                  const SizedBox(height: 10,),
                  const ViewInstructionAndMap(),
                  const SizedBox(height: 15,),
                  const ContactReceipt(),
                  const SizedBox(height: 20,),
                  const SendOrder(sending: AppStrings.sendingText, quantity: AppStrings.deliveryWeight),
                  const SizedBox(height: 20,),
                  CustomizeButton(
                    text: AppStrings.packageDelivered,
                    onTap: (){
                    },width: double.infinity,borderRadius: 20,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  const SizedBox(height: 10,),
                ]
            ),
          )
      ),
    );
  }
}
