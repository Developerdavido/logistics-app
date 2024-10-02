import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/input_field.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({
    super.key,
    required this.formKey,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final obscureOldPasswordNotifier = ValueNotifier(true);
  final obscureNewPasswordNotifier = ValueNotifier(true);
  final obscureConfirmPasswordNotifier = ValueNotifier(true);

  @override
  void dispose() {
    obscureOldPasswordNotifier.dispose();
    obscureNewPasswordNotifier.dispose();
    obscureConfirmPasswordNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          // Old Password Field
          ValueListenableBuilder(
            valueListenable: obscureOldPasswordNotifier,
            builder: (_, value, __) {
              return InputField(
                labelText: 'Old Password',
                controller: widget.oldPasswordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: value,
                suffixIcon: GestureDetector(
                  onTap: () {
                    obscureOldPasswordNotifier.value = !obscureOldPasswordNotifier.value;
                  },
                  child: Icon(
                    value ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),

          // New Password Field
          ValueListenableBuilder(
            valueListenable: obscureNewPasswordNotifier,
            builder: (_, value, __) {
              return InputField(
                labelText: 'New Password',
                controller: widget.newPasswordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: value,
                suffixIcon: GestureDetector(
                  onTap: () {
                    obscureNewPasswordNotifier.value = !obscureNewPasswordNotifier.value;
                  },
                  child: Icon(
                    value ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),


          ValueListenableBuilder(
            valueListenable: obscureConfirmPasswordNotifier,
            builder: (_, value, __) {
              return InputField(
                labelText: 'Confirm New Password',
                controller: widget.confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: value,
                suffixIcon: GestureDetector(
                  onTap: () {
                    obscureConfirmPasswordNotifier.value = !obscureConfirmPasswordNotifier.value;
                  },
                  child: Icon(
                    value ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                validator: (value) {
                  if (value != widget.newPasswordController.text.trim()) {
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
