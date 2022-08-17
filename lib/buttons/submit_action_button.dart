import 'package:devmagic_widgets/devmagic_widgets.dart';
import 'package:flutter/material.dart';

class DMSubmitActionButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Color color;
  const DMSubmitActionButton({
    required this.text,
    required this.color,
    this.onTap,
    Key? key,
  }) : super(key: key);

  const DMSubmitActionButton.dangerous({
    required this.text,
    this.onTap,
    Key? key,
  })  : color = Colors.red,
        super(key: key);

  static const _minButtonWidth = 73.0;
  static const _minButtonHeight = 33.0;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      constraints: const BoxConstraints(
        minWidth: _minButtonWidth,
        minHeight: _minButtonHeight,
      ),
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
            style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          color,
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
