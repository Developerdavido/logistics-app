

import 'package:flutter/material.dart';
import 'package:logistics_app/src/home/views/pages/trip_overview_page.dart';
import 'package:logistics_app/src/profile/views/profile_screen.dart';

import '../common/widgets/nav_item.dart';
import '../res/colours.dart';
import '../res/media.dart';

class NavService {

  //get the navigation items
  static List<NavItem> navigationItems({bool isSelected = false, String? userImage}) {
    return [
      NavItem(
          iconData: Icons.dashboard,
          navLabel: "Dashboard",
          containerColor: isSelected ? Colours.primary.withValues(alpha: 0.31) : Colours.transparentColor),
      NavItem(
          iconData: Icons.history,
          navLabel: "History",
          containerColor: isSelected ? Colours.primary.withValues(alpha: 0.31) : Colours.transparentColor),
      NavItem(
          navData: userImage ?? "",
          navLabel: "Account",
          isProfile: true,
          containerColor: isSelected ? Colours.primary.withValues(alpha: 0.31) : Colours.transparentColor),

    ];
  }

  //get the widgets for the screens
  static Widget? selectedScreen(int currentIndex) {
    List<Widget?> screens = [
      const TripOverviewPage(),
      const ProfileScreen()
    ];
    if (screens[currentIndex] != null) {
      return screens[currentIndex];
    }
    return null;
  }

}