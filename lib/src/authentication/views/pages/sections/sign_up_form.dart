import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:gap/gap.dart';
import 'package:logistics_app/core/common/widgets/input_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.fullNameController,
    required this.phoneController,
    required this.countryController,
    required this.countryNotifier,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final TextEditingController countryController;
  final ValueNotifier<Country?> countryNotifier;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final obscurePasswordNotifier = ValueNotifier(true);
  final obscureConfirmPasswordNotifier = ValueNotifier(true);
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
        widget.phoneController.clear();
        widget.countryController.clear();
      } else {
        widget.countryController.text = '+'
            '${widget.countryNotifier.value!.phoneCode}';
      }
    });
  }

  @override
  void dispose() {
    obscurePasswordNotifier.dispose();
    obscureConfirmPasswordNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputField(
            labelText: 'Full Name',
            controller: widget.fullNameController,
            keyboardType: TextInputType.name,
          ),
          const Gap(20),
          InputField(
            labelText: 'Email',
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          const Gap(20),
          ValueListenableBuilder(
            valueListenable: widget.countryNotifier,
            builder: (_, country, __) {
              return Row(
                children: [
                  Expanded(
                    child: InputField(
                      controller: widget.countryController,
                      readOnly: true,
                      labelText: country == null ? '+123' : '',
                      onTap: pickCountry,
                      validator: (value) {
                        if (!isPhoneValid(
                          widget.phoneController.text,
                          defaultCountryCode: country?.countryCode,
                        )) {
                          return '';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    flex: 3,
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
                      controller: widget.phoneController,
                      validator: (value) {
                        if (!isPhoneValid(
                          value!,
                          defaultCountryCode: country?.countryCode,
                        )) {
                          return 'Invalid Phone number';
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
          const Gap(20),
          ValueListenableBuilder(
            valueListenable: obscurePasswordNotifier,
            builder: (_, value, __) {
              return InputField(
                labelText: 'Password',
                controller: widget.passwordController,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    obscurePasswordNotifier.value =
                        !obscurePasswordNotifier.value;
                  },
                  child: Icon(
                    value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
                obscureText: value,
              );
            },
          ),
          const Gap(20),
          ValueListenableBuilder(
            valueListenable: obscureConfirmPasswordNotifier,
            builder: (_, value, __) {
              return InputField(
                labelText: 'Confirm Password',
                controller: widget.confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    obscureConfirmPasswordNotifier.value =
                        !obscureConfirmPasswordNotifier.value;
                  },
                  child: Icon(
                    value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
                obscureText: value,
                validator: (value) {
                  if (value! != widget.passwordController.text.trim()) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
