import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/mock_json.dart';
import 'package:logistics_app/core/common/widgets/app_bar.dart';
import 'package:logistics_app/core/common/widgets/customize_button.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/app_strings.dart';
import 'package:logistics_app/core/res/media.dart';
import 'package:logistics_app/src/home/widgets/delivery_mode.dart';
import 'package:logistics_app/src/home/widgets/on_and_off_switch_button.dart';
import 'package:logistics_app/src/home/widgets/order_information.dart';
import 'package:logistics_app/src/home/widgets/rider_home_header.dart';
import 'package:logistics_app/src/home/widgets/rider_name.dart';
import 'package:logistics_app/src/home/widgets/send_order.dart';
import 'package:provider/provider.dart';

import '../../../../core/res/colours.dart';
import '../../../../providers/auth_provider.dart';
import '../../widgets/contact_receipt.dart';
import '../../widgets/view_instruction_and_map.dart';

class TripOverviewPage extends StatefulWidget {
  const TripOverviewPage({super.key});

  static const path = '/trip_overview';

  @override
  State<TripOverviewPage> createState() => _TripOverviewPageState();
}

class _TripOverviewPageState extends State<TripOverviewPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;
  Map<String, dynamic> orderStatus = {};
  bool isLocationOn = false;

  changeStatus() {
    setState(() {
      if (index != MockJson.orderStatuses.length - 1) index++;
      orderStatus = MockJson.orderStatuses[index];
      log(index.toString());
    });
  }

  //this will just create a mock change of state for the status
  @override
  void initState() {
    orderStatus = MockJson.orderStatuses[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authVm = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: AppDrawer(),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RiderHomeHeader(
                onIconTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RiderName(name: authVm.currentUser?.name),
                  OnAndOffSwitchButton(onChanged: (isOn) {
                    setState(() {
                      authVm.changeLocationPermission(isOn);
                    });
                  }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: authVm.isLocationOn
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            const OrderInformation(orderType: AppStrings.openOrder, tripType: AppStrings.tripTypeText, username: AppStrings.userNameText, role: AppStrings.roleText, showTelephoneIcon: false, userImage: AssetImage(Media.defaultAvatar)),
                            const SizedBox(
                              height: 20,
                            ),
                            DeliveryMode(colorForTimeStamp: true, timeStamp: orderStatus['status'] != 'pending' ? '13 Sept,2024; 09:42' : null, deliveryType: AppStrings.pickUp, address: AppStrings.addressForDelivery),
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset(Media.arrowDownIcon),
                            const SizedBox(
                              height: 10,
                            ),
                            const DeliveryMode(deliveryType: AppStrings.delivery, address: AppStrings.addressForDelivery),
                            if (orderStatus['status'] != 'pending')
                              const SizedBox(
                                height: 10,
                              ),
                            if (orderStatus['status'] != 'pending') const ViewInstructionAndMap(),
                            if (orderStatus['status'] != 'pending')
                              const SizedBox(
                                height: 15,
                              ),
                            if (orderStatus['status'] != 'pending') const ContactReceipt(),
                            const SizedBox(
                              height: 20,
                            ),
                            const SendOrder(sending: AppStrings.sendingText, quantity: AppStrings.deliveryWeight),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomizeButton(
                              text: orderStatus["name"],
                              onTap: () {
                                changeStatus();
                              },
                              width: double.infinity,
                              borderRadius: 20,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      index = 0;
                                      orderStatus = MockJson.orderStatuses[0];
                                    });
                                  },
                                  child: const DefaultText(
                                    AppStrings.declineOrder,
                                    color: Colours.primary,
                                    fontWeight: FontWeight.w400,
                                  )),
                            )
                          ],
                        ),
                      )
                    : const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //show an image
                            Icon(
                              Icons.location_off_outlined,
                              size: 52,
                              color: Colours.textColor,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            DefaultText(
                              "No orders to be performed. \nSwitch on your location to continue seeing orders",
                              color: Colours.textColor,
                              fontSize: 18,
                              align: TextAlign.center,
                            )
                          ],
                        ),
                      ),
              )
            ])),
      ),
    );
  }
}
