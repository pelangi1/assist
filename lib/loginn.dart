import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';

class Loggin extends StatelessWidget {
  const Loggin({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown Alert Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) => Stack(
        children: [
          child!,
          const DropdownAlert()
        ],
      ),
      home: MyHomePage2(title: 'Flutter Dropdown Alert Demo'),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  void _success() {
    Map<String, dynamic> payload = new Map<String, dynamic>();
    payload["data"] = "content";
    AlertController.show(
        "Success", "Success message here!", TypeAlert.success, payload);
  }

  void _warning() {
    AlertController.show("Warn!", "Warning message here!", TypeAlert.warning);
  }

  void _error() {
    AlertController.show("Error", "Error message here!", TypeAlert.error);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AlertController.onTabListener(
        (Map<String, dynamic>? payload, TypeAlert type) {
      print("$payload - $type");
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final textStyle = TextStyle(color: Colors.white);
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title!),
          actions: [
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _success,
            ),
            IconButton(
              icon: Icon(Icons.warning),
              onPressed: _warning,
            ),
            IconButton(
              icon: Icon(Icons.error),
              onPressed: _error,
            ),
          ],
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                onPressed: _success,
                child: Text("Show success alert", style: textStyle),
                color: Colors.green,
              ),
              MaterialButton(
                onPressed: _warning,
                child: Text("Show warning alert", style: textStyle),
                color: Colors.brown,
              ),
              MaterialButton(
                  onPressed: _error,
                  child: Text(
                    "Show error alert",
                    style: textStyle,
                  ),
                  color: Colors.red)
            ],
          ),
        ));
  }
}