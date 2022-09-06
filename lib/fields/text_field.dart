import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DMTextField extends StatelessWidget {
  final String? labelText;
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

  ///If the value needs to be updated, use the controller.
  final String? initialValue;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  ///Use when you want a suffix widget different from IconData
  final Widget? suffixChild;

  ///Use when you want to use an IconData
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;

  ///Use when you want something different than the default theme
  final Color? suffixIconColor;

  /// If non-null it will be displayed
  final String? errorText;
  final int? maxLength;
  final bool obscureText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? submitForm;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final AutovalidateMode? autovalidateMode;

  const DMTextField({
    this.controller,
    this.initialValue,
    this.autovalidateMode,
    this.labelText,
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
    this.maxLength,
    this.submitForm,
    this.suffixChild,
    this.suffixIcon,
    this.suffixIconColor,
    this.onSuffixIconTap,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.textInputAction,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    Key? key,
  }) : super(key: key);

  static const _normalFontSize = 16.0;
  static const _errorFontSize = 12.0;
  static const _errorHorizontalPadding = 14.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autovalidateMode: autovalidateMode,
          textInputAction: textInputAction,
          controller: controller,
          onChanged: onChanged,
          initialValue: controller == null ? initialValue : null,
          obscureText: obscureText,
          maxLength: maxLength,
          onFieldSubmitted: (value) =>
              submitForm != null ? submitForm!() : null,
          keyboardType: keyboardType,
          textAlign: textAlign ?? TextAlign.start,
          enabled: enabled,
          decoration: InputDecoration(
            helperText: helperText,
            helperStyle: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A202C),
            ),
            counterText: "",
            hintText: hintText,
            hintStyle: hintStyle,
            fillColor: fillColor ?? const Color(0xFFF5F5F5),
            labelText: labelText,
            filled: true,
            errorText: errorText != null ? "" : null,
            border: border ?? const UnderlineInputBorder(),
            errorStyle: const TextStyle(
              fontSize: 0,
            ),
            enabledBorder: enabledBorder ??
                const UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xFF8E8E8E),
                  width: 2,
                )),
            disabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xFF8E8E8E),
              width: 2,
            )),
            focusedBorder: focusedBorder ??
                UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
            suffixIcon: suffixChild ??
                (suffixIcon != null
                    ? ClipOval(
                        child: Material(
                          shape: const CircleBorder(),
                          color: Colors.transparent,
                          child: IconButton(
                            icon: Icon(
                              suffixIcon,
                              color: suffixIconColor,
                              size: 26,
                            ),
                            onPressed: onSuffixIconTap,
                          ),
                        ),
                      )
                    : null),
          ),
          style: textStyle ??
              const TextStyle(
                color: Colors.black,
                fontSize: _normalFontSize,
              ),
          validator: validator,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
        ),
        Visibility(
          visible: errorText != null,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _errorHorizontalPadding,
            ),
            child: Text(
              errorText ?? "",
              style: const TextStyle(
                fontSize: _errorFontSize,
                fontWeight: FontWeight.w400,
                color: Color(0xFFB00020),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
