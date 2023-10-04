#include "include/isolate_functions/isolate_functions_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "isolate_functions_plugin.h"

void IsolateFunctionsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  isolate_functions::IsolateFunctionsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
