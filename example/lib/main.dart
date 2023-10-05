import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:isolate_functions/isolate_functions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _valueAdded = 0;
  final _isolateFunctionsPlugin = IsolateFunctions();

  @override
  void initState() {
    super.initState();
    iniValueCalculation();
  }

  // Value is calculated in a separate isolate.
  // Obviously, this is a trivial example, but it demonstrates the concept.
  // You can pass in any function that returns a value.
  Future<void> iniValueCalculation() async {
    int? value;
    // Calculation messages may fail, so we use a try/catch.
    // We also handle the message potentially returning null.
    //the input is 1 and you should expect 2.
    try {
      value =
          await _isolateFunctionsPlugin.isolate(Calculator().addOne, paramsMapIn:{'int':1}) ?? 'Unknown platform version';
    } on PlatformException {
      throw 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the calculation was in
    // flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _valueAdded = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Result of Calculation is: $_valueAdded\n'),
        ),
      ),
    );
  }
}


/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(Map? paramsMapIn) {
    /// Heavy lifting.
    for(var i = 0; i < 1000000000; i++) {
    }
    return paramsMapIn!['int'] + 1;
  }
}