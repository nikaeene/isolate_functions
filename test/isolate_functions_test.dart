import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:isolate_functions/isolate_functions.dart';

void main() {
  test('adds one to input values, heavy lifting and then value', () async {
    expect(
        await IsolateFunctions().isolate(Calculator().addOne, paramsIn: 1), 2);
    expect(await IsolateFunctions().isolate(Calculator().addOne, paramsIn: -7),
        -6);
    expect(
        await IsolateFunctions().isolate(Calculator().addOne, paramsIn: 0), 1);
  });
}

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int? paramsIn) {
    /// Heavy lifting.

    for (var i = 0; i < 1000000; i++) {
      Timer(const Duration(milliseconds: 20), () {});
    }
    return paramsIn! + 1;
  }
}
