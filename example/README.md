# dynamic_config_generator example

This example demonstrates how to use dynamic_config_generator.

config.json contains the variables for the `release` and `debug` modes.

Execute `flutter packages pub run build_runner build --define "dynamic_config_generator|config_builder=variant=debug"` to generate the `BuildConfig` file
for the `debug` variant.