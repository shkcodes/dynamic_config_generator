# dynamic_config_generator

Dynamically generate config for a build variant from a json file

## How to use

1. Create a configuration json file which contains the keys for a particular variant (check out the example)
2. Execute `flutter packages pub run build_runner build --define "dynamic_config_generator|config_builder=variant=$variant"`
3. This will create `build_config.g.dart` in your `lib` folder
4. That's it! Go ahead and use the `BuildConfig` constants.
