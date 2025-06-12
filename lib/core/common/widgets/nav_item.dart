import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:logistics_app/core/res/colours.dart';

import 'default_text.dart';

class NavItem extends StatelessWidget {
  final String? navData;
  final IconData? iconData;
  final String navLabel;
  final bool isProfile;
  final bool isSelected;
  final Color containerColor;
  const NavItem(
      {super.key,
        this.navData,
        required this.navLabel,
        this.iconData,
        this.isProfile = false,
        this.isSelected = false,
        required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(9)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isProfile
                ? Container(
              alignment: Alignment.center,
              height: 25,
              width: 25,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.network(
                navData ?? "",
                height: 25,
                width: 25,
                fit: BoxFit.contain,
                errorBuilder: (context, _, __) {
                  return const Icon(
                    Icons.person,
                    color: Colours.blackColor,
                    size: 25,
                  );
                },
              ),
            )
                : Icon(
              iconData,
              size: 25,
              color: containerColor,
            ),
            const Gap(8),
            DefaultText(
              navLabel,
              fontWeight: FontWeight.w400,
              fontSize: 9,
            )
          ],
        ));
  }
}