import 'package:devmagic_widgets/devmagic_widgets.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      padding: const EdgeInsets.all(DMPaddingConstants.semiLarge),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: const SizedBox(
        height: 32,
        width: 32,
        child: CircularProgressIndicator(strokeWidth: 3),
      ),
    );
  }
}
