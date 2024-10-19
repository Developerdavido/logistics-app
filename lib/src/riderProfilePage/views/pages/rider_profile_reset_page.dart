import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:logistics_app/core/common/widgets/customize_button.dart';

import '../../widgets/profile_setting_description.dart';
import '../section/profile_form.dart';


class RiderProfileResetPage extends StatefulWidget {
  const RiderProfileResetPage({super.key});
  static const path='/reset-profile';

  @override
  State<RiderProfileResetPage> createState() => _RiderProfileResetPageState();
}

class _RiderProfileResetPageState extends State<RiderProfileResetPage> {
  final _formKey = GlobalKey<FormState>();
  final _countryNotifier = ValueNotifier<Country?>(null);
  final _phoneNumberController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _countryController = TextEditingController();
  final _emailAddressController = TextEditingController();

  @override
  void dispose(){
    _countryController.dispose();
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _countryNotifier.dispose();
    _emailAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileSettingsDescription(),
            const Gap(40),
            ProfileForm(
                formKey: _formKey,
                fullNameController: _fullNameController,
                emailAddressController: _emailAddressController,
                phoneNumberController: _phoneNumberController,
                countryController: _countryController,
                countryNotifier: _countryNotifier),
            const Spacer(),
            CustomizeButton(text: 'Save changes', onTap: (){}, width: double.infinity,height: 60,borderRadius: 20,)
          ],
        ),
      ),
    );
  }
}