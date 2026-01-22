import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWheelPicker extends StatelessWidget {
  final int initialIndex;
  final ValueChanged<int> onChanged;

  const CustomWheelPicker({
    super.key,
    required this.initialIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: CupertinoPicker(
        itemExtent: 40,
        scrollController:
        FixedExtentScrollController(initialItem: initialIndex),
        onSelectedItemChanged: onChanged,
        children: List.generate(
          50,
              (i) => Center(child: Text("Item $i")),
        ),
      ),
    );
  }
}
