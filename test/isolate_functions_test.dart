import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:isolate_functions/isolate_functions.dart';



void main() {
  test('adds one to input values, heavy lifting and then value', () async{

    expect(await IsolateFunctions().isolate(Calculator().addOne, paramsMapIn:{'int':1}), 2);
    expect(await IsolateFunctions().isolate(Calculator().addOne,  paramsMapIn:{'int':-7}), -6);
    expect(await IsolateFunctions().isolate(Calculator().addOne,  paramsMapIn:{'int':0}), 1);
  });
}


/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(Map? paramsMapIn) {
    /// Heavy lifting.

    for(var i = 0; i < 1000000000; i++) {
      Timer(const Duration(milliseconds: 20), () { });
    }
    return paramsMapIn!['int'] + 1;
  }
}