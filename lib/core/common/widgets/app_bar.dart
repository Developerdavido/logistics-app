import 'package:flutter/material.dart';

import '../../res/media.dart';

class AppDrawer extends StatelessWidget {
  final List<Map<String, dynamic>> navItems = [
    {'title': 'Dashboard', 'icon': Icons.home, 'route': '/trip_overview', 'semanticsLabel': 'Go to Dashboard'},
    {'title': 'Profile', 'icon': Icons.person, 'route': '/profile', 'semanticsLabel': 'Go to Profile'},
    {'title': 'Settings', 'icon': Icons.settings, 'route': '/settings', 'semanticsLabel': 'Go to Settings'},
  ];

  @override
  Widget build(BuildContext context) {
    String? currentRoute = ModalRoute.of(context)?.settings.name;
    return Drawer(
      elevation: 16,
      child: Container(
        color: Theme.of(context).canvasColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Theme.of(context).primaryColor, Theme.of(context).primaryColorDark],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(Media.profileImage),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'My App',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'user@example.com',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            ...navItems.map((item) {
              final isSelected = currentRoute == item['route'];
              return ListTile(
                leading: Icon(
                  item['icon'],
                  color: isSelected ? Theme.of(context).primaryColor : null,
                ),
                title: Text(
                  item['title'],
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                selected: isSelected,
                selectedTileColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                onTap: () {
                  Navigator.pushReplacementNamed(context, item['route']);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}