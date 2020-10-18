import 'package:flutter/material.dart';

void main() => runApp(MyApp());
//----------------------------------------------------
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
//----------------------------------------------------
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _billAmount = 0;
  //int _billAmount2 = 0;

  void _incrementCounter() {
    setState(() {
      _counter= _counter + _billAmount;// + _billAmount2;
    });
  }

  void _minusCounter() {
    setState(() {
      _counter= _counter - _billAmount;// + _billAmount2;
    });
  }

  void _ZERO() {
    setState(() {
      _counter= 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column( // can i get it as row?
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              // onTap: () {
              //   setState(() {
              //     _incrementCounter;
              //   });
              onTap: () {
                // ignore: unnecessary_statements
                _ZERO();
              },
              child: Container(
                width: 200.0,
                height: 70.0,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.brown.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(7.0)),
                child: Center(
                  child: Text(
                    "0",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle(
                fontSize: 40,
              ),
              keyboardType:
              TextInputType.numberWithOptions(decimal: true),
              onChanged: (String value) {
                try {
                  _billAmount = int.parse(value);
                } catch (exception) {
                  _billAmount = 0;
                }
              },
            ),

//--------------------------------------------------------------
            InkWell(
              // onTap: () {
              //   setState(() {
              //     _incrementCounter;
              //   });
              onTap: () {
                // ignore: unnecessary_statements
                _incrementCounter();
              },
              child: Container(
                width: 80.0,
                height: 80.0,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.brown.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(7.0)),
                child: Center(
                  child: Text(
                    "+",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
//------------------------------------------------------------------
            InkWell(
              // onTap: () {
              //   setState(() {
              //     _incrementCounter;
              //   });
              onTap: () {
                // ignore: unnecessary_statements
                _minusCounter();
              },
              child: Container(
                width: 80.0,
                height: 80.0,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.brown.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(7.0)),
                child: Center(
                  child: Text(
                    "-",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          //---------------------------------------------------
            Text(
              'The sum:',
              style: TextStyle(
                //color: _purple,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '$_counter',
              style: TextStyle(
                //color: _purple,
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),

      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
