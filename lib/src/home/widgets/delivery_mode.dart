import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/colours.dart';

class DeliveryMode extends StatelessWidget {
  const DeliveryMode({
    super.key,
    required this.deliveryType,
    required this.address,
    this.timeStamp,
    this.colorForTimeStamp = false,
  });

  final String deliveryType;
  final String address;
  final String? timeStamp;
  final bool colorForTimeStamp;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if (timeStamp != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: DefaultText(
                timeStamp!,
                color: Colours.textColor,
              ),
            ),
          DefaultText(
            deliveryType,
            color:  Colours.primary,
          ),
          const SizedBox(height: 10),
          Text(address, softWrap: true),
        ],
      ),
    );
  }
}
