# ⏱️ Custom DateTime Picker & Wheel View (Flutter)

A **fully custom DateTime Picker and Wheel View** built using pure Flutter widgets.  
No default Material or Cupertino pickers are used.

This component is ideal for:
- Custom UI/UX designs
- Reusable Flutter packages
- iOS-style wheel pickers
- Full branding & theme control

---

## ✨ Features

✅ Custom wheel-based DateTime Picker  
✅ Custom wheel view picker (numbers / text)  
✅ Smooth scrolling (Cupertino physics)  
✅ Bottom-sheet presentation  
✅ Fully customizable UI  
✅ No third-party dependencies  
✅ Package-ready structure  

---

## ✨ Preview






https://github.com/user-attachments/assets/8b8639d4-32fc-41d9-b5e2-08eeb7c46f3e




---

## ✨ Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  custom_picker:
    path: ../custom_picker
```
▶️ From GitHub
```
dependencies:
  custom_picker:
    git:
      url: https://github.com/yourusername/custom_picker.git
```
Then Run:
```
flutter pub get
```
## 📁 Folder Structure
```
lib/
│
├── custom_date_time_picker.dart
├── custom_wheel_picker.dart
└── picker_demo_screen.dart

```
## 🚀 Usage (Demo App)



```
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// ===============================
/// DEMO SCREEN
/// ===============================
class PickerDemoScreen extends StatefulWidget {
  const PickerDemoScreen({super.key});

  @override
  State<PickerDemoScreen> createState() => _PickerDemoScreenState();
}

class _PickerDemoScreenState extends State<PickerDemoScreen> {
  DateTime selectedDateTime = DateTime.now();
  int selectedNumber = 0;

  void openDateTimePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => CustomDateTimePicker(
        initial: selectedDateTime,
        onConfirm: (value) {
          setState(() => selectedDateTime = value);
        },
      ),
    );
  }

  void openWheelPicker() {
    showModalBottomSheet(
      context: context,
      builder: (_) => CustomWheelPicker(
        initialIndex: selectedNumber,
        onChanged: (value) {
          setState(() => selectedNumber = value);
        },
      ),
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
              onPressed: openDateTimePicker,
              child: const Text("Open Custom DateTime Picker"),
            ),
            const SizedBox(height: 8),
            Text("Selected DateTime:\n$selectedDateTime"),

            const Divider(height: 40),

            ElevatedButton(
              onPressed: openWheelPicker,
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

/// ===============================
/// CUSTOM DATE TIME PICKER
/// ===============================
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

  Widget _wheel(
    int count,
    int initial,
    ValueChanged<int> onChanged,
    String Function(int) label,
  ) {
    return Expanded(
      child: CupertinoPicker(
        itemExtent: 36,
        scrollController:
            FixedExtentScrollController(initialItem: initial),
        onSelectedItemChanged: onChanged,
        children: List.generate(
          count,
          (i) => Center(
            child: Text(
              label(i),
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Select Date & Time",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
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

          /// WHEELS
          Expanded(
            child: Row(
              children: [
                _wheel(50, year - 2000,
                    (v) => setState(() => year = 2000 + v),
                    (i) => "${2000 + i}"),
                _wheel(12, month - 1,
                    (v) => setState(() => month = v + 1),
                    (i) => "M ${i + 1}"),
                _wheel(31, day - 1,
                    (v) => setState(() => day = v + 1),
                    (i) => "D ${i + 1}"),
                _wheel(24, hour,
                    (v) => setState(() => hour = v),
                    (i) => "$i h"),
                _wheel(60, minute,
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

/// ===============================
/// CUSTOM WHEEL PICKER
/// ===============================
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
          (i) => Center(
            child: Text(
              "Item $i",
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

```
## 📜 License
MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
