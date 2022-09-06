import 'package:devmagic_widgets/devmagic_widgets.dart';
import 'package:flutter/material.dart';

class DMGenderField extends StatefulWidget {
  final String title;
  final String maleTitle;
  final String femaleTitle;
  final void Function(String?)? onChanged;

  const DMGenderField({
    Key? key,
    required this.title,
    required this.maleTitle,
    required this.femaleTitle,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DMGenderField> createState() => _DMGenderFieldState();
}

class _DMGenderFieldState extends State<DMGenderField> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  String? _groupValue;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.title),
          const DMVerticalBox.small(),
          Row(
            children: [
              _radioButton(
                title: widget.maleTitle,
                value: widget.maleTitle,
                onChanged: (value) {
                  _groupValue = value!;
                  setState(() {});
                  widget.onChanged!(widget.maleTitle);
                },
              ),
              _radioButton(
                title: widget.femaleTitle,
                value: widget.femaleTitle,
                onChanged: (value) {
                  _groupValue = value!;
                  setState(() {});
                  widget.onChanged!(widget.femaleTitle);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _radioButton({
    required String title,
    required String value,
    required void Function(String?)? onChanged,
  }) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * .3,
      ),
      child: RadioListTile<String>(
        dense: true,
        value: value,
        groupValue: _groupValue,
        onChanged: onChanged,
        title: Text(title),
      ),
    );
  }
}
