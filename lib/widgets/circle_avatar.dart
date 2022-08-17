import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DMCircleAvatar extends StatelessWidget {
  const DMCircleAvatar(
      {Key? key, required this.diameter, required this.imageUrl})
      : super(key: key);
  final double diameter;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(diameter)),
        child: SizedBox(
          height: diameter,
          width: diameter,
          child: Image.network(
            imageUrl!,
            height: diameter,
            width: diameter,
            fit: BoxFit.cover,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset(
                'assets/user.png',
                width: diameter,
                height: diameter,
              );
            },
          ),
        ),
      );
    } else {
      return Image.asset(
        'assets/user.png',
        width: diameter,
        height: diameter,
      );
    }
  }
}
