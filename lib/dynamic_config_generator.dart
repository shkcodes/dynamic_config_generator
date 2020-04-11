library dynamic_config_generator;

import 'package:build/build.dart';
import 'package:dynamic_config_generator/src/config_builder.dart';

Builder configBuilder(BuilderOptions options) => ConfigBuilder(options);
