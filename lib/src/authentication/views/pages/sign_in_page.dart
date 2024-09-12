import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/extensions/context_extensions.dart';
import 'package:logistics_app/core/res/colours.dart';
import 'package:logistics_app/src/authentication/views/pages/sections/sign_in_form.dart';
import 'package:logistics_app/src/authentication/views/pages/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const path = '/sign-in';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                      'Welcome back!',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Mulish',
                    ),
                    const DefaultText(
                      'Sign in to continue',
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                    const Gap(40),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: const TextStyle(
                              color: Colours.primary,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacementNamed(
                                  SignUpPage.path,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    const Gap(40),
                    SignInForm(
                      formKey: _formKey,
                      emailController: _emailController,
                      passwordController: _passwordController,
                    ),
                    const Gap(20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const DefaultText(
                          'Forgot Password?',
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: const Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
