import 'package:flutter/material.dart';
import '../../../core/common/widgets/app_bar.dart';
import '../widgets/status_chip.dart';

class OrderDetailScreen extends StatelessWidget {
  final String orderId = '12347598';
  final String status = 'Delivered';
  final String customerName = 'Johnson Brown';
  final String pickupAddress = 'No 2, Balonny Close, Allen Avenue';
  final String deliveryAddress = '87, South Lester Street, London Close, Belgium';
  final String weight = 'Document 5kg';
  final String dateTime = '28 Aug, 4:39 PM';
  final String tripType; // "Round Trip" or "One-Way Trip"

  OrderDetailScreen({required this.tripType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.directions_bike, color: Colors.purple, size: 40),
                SizedBox(width: 10),
                Text('Ref ID: $orderId', style: TextStyle(fontSize: 18)),
                Spacer(),
                Text(dateTime, style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatusChip(status: status),
                Chip(
                  label: Text(tripType),
                  backgroundColor: tripType == 'Round Trip' ? Colors.green : Colors.orange,
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(customerName),
              subtitle: Text('Customer'),
            ),
            SizedBox(height: 10),
            Text('Pickup', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(pickupAddress),
            SizedBox(height: 10),
            Text('Delivery', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(deliveryAddress),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sending: $weight'),
                Text('Returning: $weight'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
