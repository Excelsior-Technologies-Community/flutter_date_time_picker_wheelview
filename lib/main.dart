import 'package:flutter/material.dart';
import 'package:flutter_date_time_picker_wheelview/DateTime%20Picker%20&%20Wheelview/demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PickerDemoScreen(),
    );
  }
}

