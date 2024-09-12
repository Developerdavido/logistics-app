import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:logistics_app/core/common/widgets/input_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final ValueNotifier<bool> _obscureText = ValueNotifier(true);

  @override
  void dispose() {
    _obscureText.dispose();
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
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Email',
          ),
          const Gap(40),
          ValueListenableBuilder<bool>(
            valueListenable: _obscureText,
            builder: (_, obscureText, __) {
              return InputField(
                controller: widget.passwordController,
                keyboardType: TextInputType.visiblePassword,
                labelText: 'Password',
                obscureText: obscureText,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    _obscureText.value = !obscureText;
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
