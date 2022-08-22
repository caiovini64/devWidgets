import 'package:devmagic_widgets/devmagic_widgets.dart';
import 'package:flutter/material.dart';

class DMOutlinedActionButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Color color;
  const DMOutlinedActionButton({
    required this.text,
    this.color = Colors.transparent,
    this.onTap,
    Key? key,
  }) : super(key: key);

  static const _minButtonWidth = 73.0;
  static const _minButtonHeight = 33.0;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      constraints: const BoxConstraints(
          minWidth: _minButtonWidth, minHeight: _minButtonHeight),
      padding: const EdgeInsets.symmetric(
        vertical: DMPaddingConstants.semiSmall,
        horizontal: DMPaddingConstants.semiSmall,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 112, 112, 112),
            ),
          ),
        ],
      ),
    );
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: const BorderSide(
          width: 1,
          color: Color.fromARGB(255, 112, 112, 112),
        ),
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
