import 'package:devmagic_widgets/devmagic_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class DMNameField extends StatefulWidget {
  final String labelText;
  final String emptyErrorText;
  final String invalidNameErrorText;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final Key? formKey;

  final int maxLength;
  final String? hintText;
  final String? helperText;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final Color? fillColor;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextCapitalization textCapitalization;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final Widget? suffixChild;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final Color? suffixIconColor;
  final String? errorText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? submitForm;
  final TextInputAction? textInputAction;
  final bool? enabled;

  const DMNameField({
    Key? key,
    required this.labelText,
    required this.emptyErrorText,
    required this.invalidNameErrorText,
    required this.controller,
    required this.formKey,
    this.onChanged,
    this.maxLength = 26,
    this.initialValue,
    this.hintText,
    this.helperText,
    this.hintStyle,
    this.textAlign,
    this.textStyle,
    this.fillColor,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.validator,
    this.errorText,
    this.obscureText = false,
    this.submitForm,
    this.suffixChild,
    this.suffixIcon,
    this.suffixIconColor,
    this.onSuffixIconTap,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  State<DMNameField> createState() => _DMNameFieldState();
}

class _DMNameFieldState extends State<DMNameField> {
  final _controller = TextEditingController();
  String? errorText;
  @override
  Widget build(BuildContext context) {
    return DMTextField(
      formKey: widget.formKey,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.name,
      labelText: widget.labelText,
      maxLength: widget.maxLength,
      errorText: errorText,
      controller: _controller,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: _validateForm,
      border: widget.border,
      enabledBorder: widget.enabledBorder,
      focusedBorder: widget.focusedBorder,
      fillColor: widget.fillColor,
      helperText: widget.helperText,
      hintStyle: widget.hintStyle,
      hintText: widget.hintText,
      initialValue: widget.initialValue,
      obscureText: widget.obscureText,
      onSuffixIconTap: widget.onSuffixIconTap,
      submitForm: widget.submitForm,
      suffixChild: widget.suffixChild,
      suffixIcon: widget.suffixIcon,
      suffixIconColor: widget.suffixIconColor,
      textAlign: widget.textAlign,
      textInputAction: widget.textInputAction,
      textStyle: widget.textStyle,
      enabled: widget.enabled,
    );
  }

  String? _validateForm(String? text) {
    if (text == null || text.isEmpty) {
      errorText = widget.emptyErrorText;
      SchedulerBinding.instance!.addPostFrameCallback((duration) {
        setState(() {});
      });
    } else if (!nameValidator(text)) {
      errorText = widget.invalidNameErrorText;
      SchedulerBinding.instance!.addPostFrameCallback((duration) {
        setState(() {});
      });
    } else {
      errorText = null;
      SchedulerBinding.instance!.addPostFrameCallback((duration) {
        setState(() {});
      });
    }
    return errorText;
  }

  bool nameValidator(String text) {
    final regExp = RegExp("[A-Z][a-z]* [A-Z][a-z]*");
    return regExp.hasMatch(text);
  }
}