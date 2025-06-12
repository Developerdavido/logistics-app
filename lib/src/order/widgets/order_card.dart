import 'package:flutter/material.dart';
import '../screens/order_detail_screen.dart';

class OrderCard extends StatelessWidget {
  final String address;
  final String dateTime;

  const OrderCard({
    Key? key,
    required this.address,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: ListTile(
        leading: Icon(Icons.directions_bike, color: Colors.purple), // Motor ride icon
        title: Text(address),
        subtitle: Text(dateTime),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetailScreen(tripType: "Round Trip"), // Pass the trip type dynamically if necessary
            ),
          );
        },
      ),
    );
  }
}
