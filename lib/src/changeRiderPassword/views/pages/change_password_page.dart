import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/customize_button.dart';
import 'package:logistics_app/core/res/media.dart';
import 'package:logistics_app/src/changeRiderPassword/views/pages/section/change_password_form.dart';
import '../../../../core/common/widgets/profile_details.dart';


class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});
  static const path = '/change-password';

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });


      final oldPassword = _oldPasswordController.text;
      final newPassword = _newPasswordController.text;


      if (oldPassword == "password123" && newPassword == _confirmPasswordController.text) {
        // Password change success
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password changed successfully!')),
        );
      } else {
        // Password change failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password change failed. Please try again.')),
        );
      }

      setState(() {
        _isLoading = false; // End loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Image.asset(Media.profileArrowIcon),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomLeft,
                child: ProfileDetails(
                  main: 'Change Password',
                  sub: 'Create new Password',
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: ChangePasswordForm(
                    formKey: _formKey,
                    oldPasswordController: _oldPasswordController,
                    newPasswordController: _newPasswordController,
                    confirmPasswordController: _confirmPasswordController,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomizeButton(
                text: _isLoading ? 'Processing...' : 'Save and continue',
                onTap: _isLoading ? () {} : _handleSubmit,
                width: double.infinity,
                height: 50,
                borderRadius: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
