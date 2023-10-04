//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <isolate_functions/isolate_functions_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) isolate_functions_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "IsolateFunctionsPlugin");
  isolate_functions_plugin_register_with_registrar(isolate_functions_registrar);
}
