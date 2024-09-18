import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/media.dart';

import '../../../core/res/colours.dart';

class OrderInformation extends StatelessWidget {
  const OrderInformation({
    super.key,
    required this.orderType,
    required this.tripType,
    required this.username,
    required this.role,
    required this.userImage,
    this.showTelephoneIcon = true,
  });

  final String orderType;
  final String tripType;
  final String username;
  final String role;
  final AssetImage userImage;
  final bool showTelephoneIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colours.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Image.asset(Media.packageIcon),
                      const SizedBox(width: 15),
                      DefaultText(
                        orderType,
                        fontSize: 16,
                        color: Colours.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colours.tripTypeColor[0],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: DefaultText(
                      tripType,
                      fontSize: 14, // Adjust the font size if needed
                      color: Colours.tripTypeColor[1],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: userImage,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(username),
                        const SizedBox(height: 5),
                        DefaultText(role),
                      ],
                    ),
                  ],
                ),
                // Conditionally show telephoneIcon
                if (showTelephoneIcon)
                  Image.asset(Media.telephoneIcon),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
