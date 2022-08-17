import 'package:devmagic_widgets/constants/padding_constants.dart';
import 'package:flutter/material.dart';

class DMTextButton extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;

  final VoidCallback? onTap;
  final Widget? leadingWidget;

  const DMTextButton({
    required this.text,
    required this.onTap,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.leadingWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.3),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(DMPaddingConstants.semiSmall),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leadingWidget != null)
                Padding(
                  padding: const EdgeInsets.only(
                    right: DMPaddingConstants.semiSmall,
                  ),
                  child: leadingWidget,
                ),
              Text(
                text,
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: color ?? Theme.of(context).colorScheme.primary,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
