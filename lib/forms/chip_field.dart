import 'package:devmagic_widgets/devmagic_widgets.dart';
import 'package:flutter/material.dart';
import 'package:chip_list/chip_list.dart';

class DMChipField extends StatefulWidget {
  final String title;
  final List<String> items;
  final List<int> selectedItems;
  final void Function(List<String>?)? onChanged;

  const DMChipField({
    Key? key,
    required this.title,
    required this.items,
    this.selectedItems = const [],
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DMChipField> createState() => _DMChipFieldState();
}

List<int> _currentlySelected = [];
List<int> _selectedItems = [];

class _DMChipFieldState extends State<DMChipField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const DMHorizontalBox.small(),
        ChipList(
          supportsMultiSelect: true,
          listOfChipNames: widget.items,
          listOfChipIndicesCurrentlySeclected: _currentlySelected,
          extraOnToggle: (value) {
            _updateSelectedItems(value);
          },
        ),
      ],
    );
  }

  _updateSelectedItems(value) {
    if (_selectedItems.contains(value)) {
      _selectedItems.remove(value);
      setState(() {});
    } else {
      _selectedItems.add(value);
      setState(() {});
    }
    final chipItems = <String>[];
    for (final i in _selectedItems) {
      chipItems.add(widget.items[i]);
    }
    widget.onChanged!(chipItems);
  }
}
