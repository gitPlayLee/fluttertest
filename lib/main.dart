import 'package:flutter/material.dart';
import 'car_time.dart';
import 'new_tint.dart';
import 'new_rule.dart';
import 'car_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('FrameWidget'),
        ),
        body: Container(
          color: Color(0xffa7a7a7),
          width: 3000,
          height: 500,
          child: const CarTimeBar(
            width: 700,
          ),
        )
      ),
    );
  }
}