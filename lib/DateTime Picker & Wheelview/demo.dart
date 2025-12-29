import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_date_time_picker_wheelview/DateTime%20Picker%20&%20Wheelview/CustomDateTimePicker.dart';
import 'package:flutter_date_time_picker_wheelview/DateTime%20Picker%20&%20Wheelview/custom_wheel_picker.dart';

class PickerDemoScreen extends StatefulWidget {
  const PickerDemoScreen({super.key});

  @override
  State<PickerDemoScreen> createState() => _PickerDemoScreenState();
}

class _PickerDemoScreenState extends State<PickerDemoScreen> {
  DateTime selectedDateTime = DateTime.now();
  int selectedNumber = 0;

  /// CUSTOM DATE TIME PICKER
  void openCustomDateTimePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return CustomDateTimePicker(
          initial: selectedDateTime,
          onConfirm: (value) {
            setState(() => selectedDateTime = value);
          },
        );
      },
    );
  }

  /// CUSTOM WHEEL VIEW
  void openCustomWheelPicker() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return CustomWheelPicker(
          initialIndex: selectedNumber,
          onChanged: (value) {
            setState(() => selectedNumber = value);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Picker Demo")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: openCustomDateTimePicker,
              child: const Text("Open Custom DateTime Picker"),
            ),
            const SizedBox(height: 8),
            Text("Selected DateTime:\n$selectedDateTime"),

            const Divider(height: 40),

            ElevatedButton(
              onPressed: openCustomWheelPicker,
              child: const Text("Open Custom Wheel Picker"),
            ),
            const SizedBox(height: 8),
            Text("Selected Item: $selectedNumber"),
          ],
        ),
      ),
    );
  }
}
