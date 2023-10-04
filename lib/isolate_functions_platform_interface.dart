import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'isolate_functions_method_channel.dart';

abstract class IsolateFunctionsPlatform extends PlatformInterface {
  /// Constructs a IsolateFunctionsPlatform.
  IsolateFunctionsPlatform() : super(token: _token);

  static final Object _token = Object();

  static IsolateFunctionsPlatform _instance = MethodChannelIsolateFunctions();

  /// The default instance of [IsolateFunctionsPlatform] to use.
  ///
  /// Defaults to [MethodChannelIsolateFunctions].
  static IsolateFunctionsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IsolateFunctionsPlatform] when
  /// they register themselves.
  static set instance(IsolateFunctionsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
