#ifndef FLUTTER_PLUGIN_ISOLATE_FUNCTIONS_PLUGIN_H_
#define FLUTTER_PLUGIN_ISOLATE_FUNCTIONS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace isolate_functions {

class IsolateFunctionsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  IsolateFunctionsPlugin();

  virtual ~IsolateFunctionsPlugin();

  // Disallow copy and assign.
  IsolateFunctionsPlugin(const IsolateFunctionsPlugin&) = delete;
  IsolateFunctionsPlugin& operator=(const IsolateFunctionsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace isolate_functions

#endif  // FLUTTER_PLUGIN_ISOLATE_FUNCTIONS_PLUGIN_H_
