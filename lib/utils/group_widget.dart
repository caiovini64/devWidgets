import 'package:flutter/material.dart';

class GroupOf extends StatelessWidget {
  final String title;
  final Widget child;

  static const double _spaceBetween = 8.0;
  const GroupOf({
    required this.title,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
        ),
        const SizedBox(height: _spaceBetween),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
            width: 2,
            color: Colors.grey,
          )),
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ],
    );
  }
}
