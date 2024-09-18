import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_app/core/extensions/context_extensions.dart';

class InputField extends StatefulWidget {
  const InputField({
    required this.controller,
    super.key,
    this.suffixIcon,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.defaultValidation = true,
    this.inputFormatters,
    this.prefix,
    this.enabled = true,
    this.readOnly = false,
    this.contentPadding,
    this.prefixIcon,
    this.focusNode,
    this.onTap,
    this.expandable = false,
    this.labelText,
  });

  final Widget? suffixIcon;
  final String? hintText;
  final String? Function(String? value)? validator;
  final TextEditingController controller;

  final TextInputType? keyboardType;
  final bool obscureText;
  final bool defaultValidation;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final bool enabled;
  final bool readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool expandable;
  final String? labelText;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const border = UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFBDBDBD)),
    );
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      focusNode: _focusNode,
      obscureText: widget.obscureText,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      maxLines: widget.expandable ? 5 : 1,
      minLines: widget.expandable ? 1 : null,
      style: GoogleFonts.roboto(),
      onTap: widget.onTap,
      onTapOutside: (_) => _focusNode.unfocus(),
      decoration: InputDecoration(
        border: border,
        enabledBorder: border,
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: GoogleFonts.roboto(
          color: const Color(0xFFBDBDBD),
        ),
        suffixIcon: widget.suffixIcon,
        hintStyle: GoogleFonts.roboto(color: const Color(0xFFBDBDBD)),
        suffixIconColor: context.theme.hintColor,
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon,
      ),
      inputFormatters: widget.inputFormatters,
      validator: widget.defaultValidation
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'Required Field';
              }
              return widget.validator?.call(value);
            }
          : widget.validator,
    );
  }
}
