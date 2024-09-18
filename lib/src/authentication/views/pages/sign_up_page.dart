import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/formatter_utils.dart';
import 'package:gap/gap.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/extensions/context_extensions.dart';
import 'package:logistics_app/core/res/colours.dart';
import 'package:logistics_app/src/authentication/views/pages/sections/sign_up_form.dart';
import 'package:logistics_app/src/authentication/views/pages/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const path = '/sign-up';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _countryController = TextEditingController();

  final _countryNotifier = ValueNotifier<Country?>(null);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    _countryController.dispose();
    _countryNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const DefaultText(
                      'Create an account',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Mulish',
                    ),
                    const DefaultText(
                      'Sign up to get started',
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                    const Gap(40),
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: const TextStyle(
                              color: Colours.primary,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacementNamed(
                                  SignInPage.path,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    const Gap(40),
                    SignUpForm(
                      formKey: _formKey,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
                      fullNameController: _fullNameController,
                      phoneController: _phoneController,
                      countryController: _countryController,
                      countryNotifier: _countryNotifier,
                    ),
                    const Gap(20),
                  ],
                ),
              ),
              FilledButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    final phoneNumber = _phoneController.text.trim();
                    final country = _countryNotifier.value!;
                    final formattedNumber =
                        '+${country.phoneCode}${toNumericString(phoneNumber)}';
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();
                    final fullName = _fullNameController.text.trim();
                  }
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
