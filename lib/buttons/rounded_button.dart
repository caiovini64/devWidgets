import 'package:flutter/material.dart';

class DMRoundedButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final IconData? icon;
  final bool? enabled;
  final bool? isLoading;
  final Color backgroundColor;
  const DMRoundedButton({
    this.child,
    this.onTap,
    this.enabled,
    this.isLoading,
    this.backgroundColor = Colors.blue,
    Key? key,
  })  : icon = null,
        super(key: key);

  const DMRoundedButton.icon({
    required this.icon,
    this.onTap,
    this.enabled,
    this.isLoading,
    this.backgroundColor = Colors.blue,
    Key? key,
  })  : child = null,
        super(key: key);

  static const _size = 79.0;
  static const _iconSize = 40.0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled == false ? null : onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          (onTap != null || enabled == true || enabled == null) &&
                  enabled != false
              ? backgroundColor
              : Colors.grey,
        ),
        shape: MaterialStateProperty.all<CircleBorder>(
          const CircleBorder(),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ),
      ),
      child: SizedBox.fromSize(
        size: const Size.square(_size),
        child: isLoading == true
            ? const Center(
                child: SizedBox(
                  width: _iconSize,
                  height: _iconSize,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                    size: _iconSize,
                  )
                : child,
      ),
    );
  }
}
