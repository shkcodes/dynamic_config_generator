# dynamic_config_generator

Generate configuration constants for different environments from a json file.

## How to use

1. Create a `config.json` file  within the `tool` directory which contains the keys for a particular variant (check out the Example section for more)
2. Execute `flutter packages pub run build_runner build --define "dynamic_config_generator|config_builder=variant=$variant"`. The value of the variant would be `debug`or `release` for the example below. 
> You can supply **$variant** via an environment variable in your CI setup.

3. This will create `build_config.g.dart` in your `lib` folder
4. Import this file in the relevant classes and use the generated `BuildConfig` constants.

## Example

```
{
  "debug": {
    "isRelease": false,
    "apiKey": "apiKeyDebug"
  },
  "release": {
    "isRelease": true,
    "apiKey": "apiKeyRelease"
  }
}
```

will generate the file `build_config.g.dart` with the following content if you build for the release variant.
```
abstract class BuildConfig {
  static const isRelease = 'true';
  static const apiKey = 'apiKeyRelease';
}
```