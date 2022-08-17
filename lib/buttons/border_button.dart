import 'package:devmagic_widgets/devmagic_widgets.dart';
import 'package:flutter/material.dart';

class DMBorderButtonWidget extends StatelessWidget {
  final Function onTap;
  final String text;

  const DMBorderButtonWidget(
      {Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.primary),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: const BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DMPaddingConstants.semiSmall),
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
      onPressed: () => onTap(),
    );
  }
}
