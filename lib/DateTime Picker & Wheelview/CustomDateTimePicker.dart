import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDateTimePicker extends StatefulWidget {
  final DateTime initial;
  final ValueChanged<DateTime> onConfirm;

  const CustomDateTimePicker({
    super.key,
    required this.initial,
    required this.onConfirm,
  });

  @override
  State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  late int year, month, day, hour, minute;

  @override
  void initState() {
    super.initState();
    year = widget.initial.year;
    month = widget.initial.month;
    day = widget.initial.day;
    hour = widget.initial.hour;
    minute = widget.initial.minute;
  }

  Widget wheel(int count, int initial, ValueChanged<int> onChanged,
      String Function(int) label) {
    return Expanded(
      child: CupertinoPicker(
        itemExtent: 36,
        scrollController:
        FixedExtentScrollController(initialItem: initial),
        onSelectedItemChanged: onChanged,
        children: List.generate(
          count,
              (i) => Center(child: Text(label(i))),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Select Date & Time",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {
                  widget.onConfirm(
                    DateTime(year, month, day, hour, minute),
                  );
                  Navigator.pop(context);
                },
                child: const Text("Done"),
              )
            ],
          ),
          const Divider(),
          Expanded(
            child: Row(
              children: [
                wheel(50, year - 2000,
                        (v) => setState(() => year = 2000 + v),
                        (i) => "${2000 + i}"),
                wheel(12, month - 1,
                        (v) => setState(() => month = v + 1),
                        (i) => "M ${i + 1}"),
                wheel(31, day - 1,
                        (v) => setState(() => day = v + 1),
                        (i) => "D ${i + 1}"),
                wheel(24, hour,
                        (v) => setState(() => hour = v),
                        (i) => "$i h"),
                wheel(60, minute,
                        (v) => setState(() => minute = v),
                        (i) => "$i m"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
