import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/app_strings.dart';
import 'package:logistics_app/core/res/colours.dart';

class OnAndOffSwitchButton extends StatefulWidget {
  const OnAndOffSwitchButton({super.key});

  @override
  State<OnAndOffSwitchButton> createState() => _OnAndOffSwitchButtonState();
}

class _OnAndOffSwitchButtonState extends State<OnAndOffSwitchButton> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 35,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colours.primaryGradient[2],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildSwitchButton(
              label: AppStrings.off,
              isActive: !isOn,
              onTap: () {
                setState(() {
                  isOn = false;
                });
              },
            ),
            _buildSwitchButton(
              label: AppStrings.on,
              isActive: isOn,
              onTap: () {
                setState(() {
                  isOn = true;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchButton({
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 35,  // Set width of each button
        height: 21, // Set height of each button
        decoration: BoxDecoration(
          color: isActive ? Colours.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: DefaultText(
            label,
            color: isActive ? Colours.whiteColor : Colours.blackColor,
          ),
        ),
      ),
    );
  }
}
