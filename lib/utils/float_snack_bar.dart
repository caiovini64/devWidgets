import 'package:flutter/material.dart';
import 'dart:async';

class DMFloatSnackBar extends StatefulWidget {
  final String text;
  final Duration duration;
  final SnackBarAction? action;
  final Color textColor;

  const DMFloatSnackBar({
    Key? key,
    required this.text,
    this.duration = const Duration(milliseconds: 3000),
    this.action,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  State<DMFloatSnackBar> createState() => _DMFloatSnackBarStates();
}

class _DMFloatSnackBarStates extends State<DMFloatSnackBar> {
  @override
  void initState() {
    super.initState();
    Timer(widget.duration, () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          if (widget.action != null)
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: InkWell(
                onTap: widget.action!.onPressed,
                child: Text(
                  widget.action!.label,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Future showFloatSnackBar(BuildContext context, String content) async {
  return showModalBottomSheet(
    barrierColor: Colors.black.withAlpha(1),
    backgroundColor: Colors.black.withAlpha(1),
    context: context,
    builder: (context) {
      return DMFloatSnackBar(text: content);
    },
  );
}
