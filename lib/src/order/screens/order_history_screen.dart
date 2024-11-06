import 'package:flutter/material.dart';
import '../widgets/order_card.dart';
import '../widgets/custom_tab_bar.dart';
import '../../home/widgets/drawer.dart';

class OrderHistoryScreen extends StatefulWidget {

  const OrderHistoryScreen({super.key});

  static const path = '/orderHistoryScreen';

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final List orders = [
    {
      'address': '87, South Lester Street, London Close, Belgium',
      'dateTime': '28 Aug, 4:39 PM',
    },
    {
      'address': '23, Allan Avenue, Sank Church, Berman',
      'dateTime': '28 Aug, 4:35 PM',
    },
    {
      'address': 'No 2, Balonny Close, Allen Avenue',
      'dateTime': '12 Nov, 4:39 PM',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          CustomTabBar(),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrderCard(
                  address: orders[index]['address'],
                  dateTime: orders[index]['dateTime'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
