import 'dart:isolate';

import 'package:flutter/services.dart';

class IsolateFunctions {
  /// Get the function and parameters as a Map from the calling isolate and return the result.
  Future<dynamic> isolate(Function functionIn, {dynamic paramsIn}) async {
    final rp = ReceivePort();
    final isolateRootToken = RootIsolateToken.instance!;
    await Isolate.spawn<_DataModel>(
      _getResponse,
      _DataModel(
        isolateRootToken: isolateRootToken,
        function: (value) async =>
            await value != null ? functionIn(value) : functionIn(),
        params: paramsIn,
        answerPort: rp.sendPort,
      ),
    );
    return await rp.first;
  }

  ///Quit the calling isolate.
  void quit() {
    Isolate.current.kill();
  }

  ///Quit all isolates.
  void quitAll() {
    Isolate.exit();
  }

  ///Get the response from the isolate.
  void _getResponse(_DataModel data) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(data.isolateRootToken);
    final answer = await data.function(data.params);
    data.answerPort.send(answer);
  }
}

///Data model for the isolate.
class _DataModel {
  final RootIsolateToken isolateRootToken;
  final Function function;
  final dynamic params;
  final SendPort answerPort;

  _DataModel({
    required this.isolateRootToken,
    required this.function,
    required this.answerPort,
    this.params,
  });
}
