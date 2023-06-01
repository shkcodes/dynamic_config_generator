import 'dart:convert';
import 'dart:io';

import 'package:build/build.dart';

class ConfigBuilder extends Builder {
  final BuilderOptions options;

  ConfigBuilder(this.options);

  @override
  Map<String, List<String>> get buildExtensions => {
        '.json': ['.g.dart']
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    final rawJson = await buildStep.readAsString(buildStep.inputId);
    final filePath = buildStep.inputId.path;
    if (!(filePath.endsWith("config.json"))) {
      return;
    }
    Map<String, dynamic> parsedJson = jsonDecode(rawJson);
    final variant = options.config['variant'] ?? 'debug';
    final values = parsedJson[variant] as Map<String, dynamic>?;
    if (values == null) {
      throw Exception('supplied variant not found in json');
    }
    final output = <String>[];
    output.add('abstract class BuildConfig {');
    for (var key in values.keys) {
      final value = values[key];
      if (value is int) {
        output.add('  static const $key = ${int.parse(value.toString())};');
      } else if (value is String) {
        output.add('  static const $key = \'${value.toString()}\';');
      } else if (value is bool) {
        output.add('\tstatic const $key = ${value == true};');
      }
    }
    output.add('}\n');
    final file = File('lib/build_config.g.dart');
    await file.writeAsString(output.join('\n'));
  }
}
