
import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/common/widgets/loader.dart';
import 'package:logistics_app/providers/address_provider.dart';
import 'package:logistics_app/src/authentication/views/pages/sign_in_page.dart';
import 'package:provider/provider.dart';

import '../../../core/common/widgets/app_bar.dart';
import '../../../core/res/colours.dart';
import '../../../core/res/media.dart';
import '../../../providers/auth_provider.dart';


class ProfileScreen extends StatefulWidget {

  static const path='/profile';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AddressProvider? addressProvider;
  AuthProvider? authVm;

  @override
  void initState() {
    addressProvider = context.read<AddressProvider>();
    authVm = context.read<AuthProvider>();
    addressProvider?.fetchSpecificAddressDetails(context, authVm?.currentUser?.address);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    authVm = Provider.of<AuthProvider>(context);
    addressProvider = context.watch<AddressProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
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
                  backgroundImage: const AssetImage(Media.profileImage),
                  backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authVm?.currentUser?.name ?? "Anon",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        authVm?.currentUser?.address ?? "N/A", // Star symbol
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Spending Overview Card
            addressProvider!.loadingWalletDetails ? const Loader()  : Card(
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
                      'Amount earned',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                     Text(
                      'ADA ${addressProvider?.addressAdaTokens ?? 0.00}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '\$ ${addressProvider?.amountInDollars ?? 0.00}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 12521.10 / 20000.00,
                      backgroundColor: Colors.grey[300],
                      color: Colours.primary,
                      minHeight: 8,
                    ),
                    SizedBox(height: 8),

                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            // Navigation Menu
            ListTile(
              leading: Icon(Icons.person, color: Colours.primary),
              title: Text('My Account'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // Navigate to My Account (current page)
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt, color: Colours.primary),
              title: Text('Transaction History'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.security, color: Colours.primary),
              title: Text('Security Settings'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colours.primary),
              title: Text('General Settings'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
              },
            ),
            // Bottom Navigation (Placeholder)
            const SizedBox(height: 40),
            Center(
              child: TextButton(onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, SignInPage.path, (route)=> false);
              }, child: const DefaultText("Log Out", color: Colours.redColor, fontSize: 18, fontWeight: FontWeight.w600,)),
            )
          ],
        ),
      ),
    );
  }
}