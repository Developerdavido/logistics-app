import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:logistics_app/core/common/widgets/input_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';



class ProfileForm extends StatefulWidget {
  const ProfileForm({
    super.key,
    required this.formKey,
    required this.fullNameController,
    required this.emailAddressController,
    required this.phoneNumberController,
    required this.countryController,
    required this.countryNotifier,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController emailAddressController;
  final TextEditingController phoneNumberController;
  final TextEditingController countryController;
  final ValueNotifier<Country?> countryNotifier;

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final phoneFocusNode = FocusNode();

  void pickCountry() {
    showCountryPicker(
      context: context,
      onSelect: (country) {
        if (country == widget.countryNotifier.value) return;
        widget.countryNotifier.value = country;
        phoneFocusNode.requestFocus();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    widget.countryNotifier.addListener(() {
      if (widget.countryNotifier.value == null) {
        widget.phoneNumberController.clear();
        widget.countryController.clear();
      } else {
        widget.countryController.text = '+${widget.countryNotifier.value!.phoneCode}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputField(
            controller: widget.fullNameController,
            keyboardType: TextInputType.name,
            labelText: 'Full Name',
          ),
          const Gap(40),
          InputField(
            labelText: 'Email',
            controller: widget.emailAddressController,
            keyboardType: TextInputType.emailAddress,
          ),
          const Gap(20),
          ValueListenableBuilder(
            valueListenable: widget.countryNotifier,
            builder: (_, country, __) {
              return Row(
                children: [

                  SizedBox(
                    width: 80,
                    child: InputField(
                      controller: widget.countryController,
                      readOnly: true,
                      labelText: country == null ? '+233' : 'Country Code',
                      onTap: pickCountry,
                      validator: (value) {
                        if (!isPhoneValid(
                          widget.phoneNumberController.text,
                          defaultCountryCode: country?.countryCode,
                        )) {
                          return 'Invalid country code';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Gap(9),


                  Expanded(
                    child: InputField(
                      labelText: 'Phone',
                      focusNode: phoneFocusNode,
                      readOnly: country == null,
                      onTap: () {
                        if (country == null) {
                          pickCountry();
                        }
                      },
                      keyboardType: TextInputType.phone,
                      controller: widget.phoneNumberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone number is required';
                        }
                        if (!isPhoneValid(
                          value,
                          defaultCountryCode: country?.countryCode,
                        )) {
                          return 'Invalid phone number';
                        }
                        return null;
                      },
                      inputFormatters: [
                        PhoneInputFormatter(
                          defaultCountryCode: country?.countryCode,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
