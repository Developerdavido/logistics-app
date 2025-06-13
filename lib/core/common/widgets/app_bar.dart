import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../res/media.dart';

class AppDrawer extends StatelessWidget {
  final List<Map<String, dynamic>> navItems = [
    {'title': 'Dashboard', 'icon': Icons.home, 'route': '/trip_overview', 'semanticsLabel': 'Go to Dashboard'},
    {'title': 'Profile', 'icon': Icons.person, 'route': '/profile', 'semanticsLabel': 'Go to Profile'},
    {'title': 'Orders', 'icon': Icons.timeline, 'route': '/orderHistoryScreen', 'semanticsLabel': 'Go to Orders'},
  ];

  @override
  Widget build(BuildContext context) {
    final authVm = Provider.of<AuthProvider>(context);
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(Media.profileImage),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    authVm.currentUser?.name ?? "",
                    style:const  TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      authVm.currentUser?.email ?? "",
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
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