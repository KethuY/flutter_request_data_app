import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new SampleApp());

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: new SampleAppTest());
  }
}

class SampleAppTest extends StatefulWidget {
  @override
  _SampleAppTestState createState() => new _SampleAppTestState();
}

class _SampleAppTestState extends State<SampleAppTest> {
  static const platform = const MethodChannel('app.channel.shared.data');
  String sharedData = 'No data';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getSharedText();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text(sharedData),
      ),
    );
  }

  getSharedText() async {
    var sharedText = await platform.invokeMethod("getSharedText");

    if (sharedText != null) {
      setState(() {
        sharedData = sharedText;
      });
    }
  }
}
