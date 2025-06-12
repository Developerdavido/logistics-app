import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBar(
        indicatorColor: Colors.purple,
        tabs: [
          Tab(
            child: Text(
              'History',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Tab(
            child: Text(
              'Ongoing',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
