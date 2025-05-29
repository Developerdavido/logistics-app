
import 'package:flutter/material.dart';

import '../../../core/common/widgets/app_bar.dart';


class ProfileScreen extends StatelessWidget {

  static const path='/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Update selected route in NavProvider

    // Define teal color from the image (approximated)
    const tealColor = Color(0xFF26A69A);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code),
            onPressed: () {
              // Placeholder for QR code action
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('QR Code clicked')),
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://example.com/user.jpg'),
                  backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ali Husni',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        '★', // Star symbol
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            // Spending Overview Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Spending Overview',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$12,521.10',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'From \$20,000.00',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 12521.10 / 20000.00,
                      backgroundColor: Colors.grey[300],
                      color: tealColor,
                      minHeight: 8,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.circle, size: 12, color: Colors.black),
                        SizedBox(width: 4),
                        Text('Subscription'),
                        Spacer(),
                        Text('\$8,221.00'),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.circle, size: 12, color: tealColor),
                        SizedBox(width: 4),
                        Text('Friend & Family'),
                        Spacer(),
                        Text('\$4,300.10'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            // Invite Friends Section
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: tealColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Invite Friends',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Invite your friends to managing their finances and get \$100 each.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.group_add, color: Colors.white, size: 40),
                ],
              ),
            ),
            SizedBox(height: 24),
            // Navigation Menu
            ListTile(
              leading: Icon(Icons.person, color: tealColor),
              title: Text('My Account'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // Navigate to My Account (current page)
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt, color: tealColor),
              title: Text('Transaction History'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                Navigator.pushNamed(context, '/transaction_history');
              },
            ),
            ListTile(
              leading: Icon(Icons.security, color: tealColor),
              title: Text('Security Settings'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                Navigator.pushNamed(context, '/security_settings');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: tealColor),
              title: Text('General Settings'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                Navigator.pushNamed(context, '/general_settings');
              },
            ),
            // Bottom Navigation (Placeholder)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home, color: tealColor),
                  Icon(Icons.bar_chart, color: tealColor),
                  Icon(Icons.credit_card, color: tealColor),
                  Icon(Icons.account_circle, color: tealColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}