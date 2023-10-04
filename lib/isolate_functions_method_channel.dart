import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'isolate_functions_platform_interface.dart';

/// An implementation of [IsolateFunctionsPlatform] that uses method channels.
class MethodChannelIsolateFunctions extends IsolateFunctionsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('isolate_functions');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
