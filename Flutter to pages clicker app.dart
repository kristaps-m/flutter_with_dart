import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BaseApp(),
        routes: <String, WidgetBuilder>{
          "/LoginAsUser": (context) => LoginAsUser(),
          "/LoginAsGuest": (context) => LoginAsGuest()
        },
    );
  }
}

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("#1 awad"),),
        body: Center(
            child: Column(
              children: [
                FlatButton(onPressed: (){
                  Navigator.pushNamed(context, "/LoginAsUser");
                },color: Colors.green, child: Text("Login User!"),),
                FlatButton(onPressed: (){
                  Navigator.pushNamed(context, "/LoginAsGuest");
                }, color: Colors.red, child: Text("Login Guest!"),)
              ],
            )
        )
    );
  }
}

class LoginAsUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome User!"),),
      body: RaisedButton(
        child: Text("GO BACK!"),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}

class LoginAsGuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome Guest!\nThis is clicker App"),),
      body: MyHomePage()
      //-----------------------
//           return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
      //----------------------
    );
  }
}



// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//----------------------------------------
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       appBar: AppBar( // This gets OVER writed and back button to
//         title: Text(widget.title),
//       ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
