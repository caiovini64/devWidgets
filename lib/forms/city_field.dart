import 'package:flutter/material.dart';

class DMCityField extends StatefulWidget {
  final List<String> list;
  final String title;
  final void Function(String?)? onChanged;

  const DMCityField({
    Key? key,
    required this.list,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DMCityField> createState() => _DMCityFieldState();
}

String? _dropDownValue;

class _DMCityFieldState extends State<DMCityField> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: _dropDownValue == null ? Text(widget.title) : Text(_dropDownValue!),
      icon: const Icon(Icons.arrow_drop_down_sharp),
      elevation: 16,
      underline: Container(
        height: 2,
        color: const Color(0xFF8E8E8E),
      ),
      onChanged: (String? value) {
        _dropDownValue = value;
        widget.onChanged?.call(value);
        setState(() {});
        print(_dropDownValue);
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
