# isolate_functions

A Flutter plugin to run functions in a separate isolate. You can run functions with arguments and return values.


## Getting Started

We use this plugin to run functions that take a long time to execute, such as image processing.
This plugin is based on [flutter_isolate](https://pub.dev/packages/flutter_isolate).
We simplified the usage of the plugin and added the ability to run functions with arguments and return values.

## Usage
Some heavy computation functions may take a long time to execute. If you run them in the main isolate, the UI will freeze.
Then you can simply pass the function to the plugin and it will run it in a separate isolate.
The plugin will return the result of the function execution.


## Example
You will pass the function and if you have parameters you will pass them in a map. The function will work in Isolate and return the result.

```dart
await IsolateFunctions().isolate(Calculator().addOne, paramsMapIn:{'int':1}).then((value) => print(value));
``` 
```dart
/// A Calculator.
class Calculator {
/// Returns [value] plus 1.
int addOne(Map? paramsMapIn) {
/// Heavy lifting.
var total = 0;
for(var i = 0; i < 1000000000; i++) {
total += i;
}
return paramsMapIn!['int'] + 1;
}
}
```

You can use quite to simply quit the current isolate. And use quitAll to quit all isolates.