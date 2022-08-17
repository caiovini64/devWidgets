import 'package:devmagic_widgets/constants/padding_constants.dart';
import 'package:flutter/material.dart';

class DMSubmitButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final TextStyle? textStyle;
  final double minWidth;
  //If needed, prefer to use Icon
  final Widget? leadingWidget;
  final bool isOutlined;
  final bool isLoading;
  final Color? buttonColor;
  const DMSubmitButton({
    required this.text,
    this.textStyle,
    this.minWidth = 193,
    this.onTap,
    this.leadingWidget,
    this.isOutlined = false,
    this.isLoading = false,
    this.buttonColor,
    Key? key,
  }) : super(key: key);

  static const _loadingSize = 22.0;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      constraints: BoxConstraints(
        minWidth: minWidth,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: DMPaddingConstants.medium,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: isLoading
            ? [
                const SizedBox(
                  width: _loadingSize,
                  height: _loadingSize,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ]
            : [
                if (leadingWidget != null)
                  Padding(
                    padding: const EdgeInsets.only(
                      right: DMPaddingConstants.semiLarge,
                    ),
                    child: leadingWidget,
                  ),
                Text(
                  text,
                  style: textStyle ??
                      Theme.of(context).textTheme.button?.copyWith(
                            color: isOutlined ? Colors.black : Colors.white,
                          ),
                ),
              ],
      ),
    );
    if (isOutlined) {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: const BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
        onPressed: onTap,
        child: child,
      );
    }
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          onTap != null ? buttonColor ?? Colors.blue : Colors.grey,
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.42),
          ),
        ),
      ),
      child: child,
    );
  }
}
