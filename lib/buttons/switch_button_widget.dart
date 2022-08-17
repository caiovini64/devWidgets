import 'package:flutter/material.dart';

class DMSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color backgroundColor;

  const DMSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.backgroundColor = Colors.blue,
  }) : super(key: key);

  @override
  DMSwitchState createState() => DMSwitchState();
}

class DMSwitchState extends State<DMSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;
  static const _buttonWidth = 43.0;
  static const _buttonHeight = 21.5;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 60),
    );
    _circleAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
    if (widget.value) {
      _animationController.value = 1;
    }
  }

  @override
  void didUpdateWidget(covariant DMSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            widget.onChanged(!widget.value);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
            width: _buttonWidth,
            height: _buttonHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: widget.value ? widget.backgroundColor : Colors.grey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Align(
                alignment: _circleAnimation.value,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
