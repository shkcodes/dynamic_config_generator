import 'package:flutter/material.dart';
import 'package:example/build_config.g.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Config Generator Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Dynamic Config Generator Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("is_release = ${BuildConfig.isRelease}"),
            SizedBox(
              height: 20,
            ),
            Text("api_key = ${BuildConfig.apiKey}"),
          ],
        ),
      ),
    );
  }
}
