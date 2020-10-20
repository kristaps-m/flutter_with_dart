import 'package:flutter/material.dart';
import 'dart:math';

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
      home: MyHomePage(title: 'Sum app'),
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
  var sumList = [];
  int sumInt = 0;
  int end_multiple = 1;
  //int _billAmount2 = 0;

  void _incrementCounter() {
    setState(() {
      //_counter= _counter + _billAmount;// + _billAmount2;
      sumList.forEach((element) {
        sumInt += element;
      });
      print("$sumInt Hi this is sumInt");
    });
  }

  void _removeFromList() {
    setState(() {
      sumList.removeLast();
    });
  }

  void _ZERO() {
    setState(() {
      //_counter= 0;
      sumInt = 0;
      sumList = [];
    });
  }

  void _addToList() {
    setState(() {
      sumList.add(_billAmount);
    });
  }

  void _showLMC(){
    setState(() {
      lcm_of_list(sumList);
    });
  }

//---------------LMC stuff---------------------------------------------------
  lcm_of_list(numbers) {
    List BIGL = [];
    Set MEGA = new Set();
    var res = [];
    int C = 0;
    // print();
    numbers.forEach((e) => C += 1);
    for (int i = 0; i < C; i++) {
      BIGL.add(primefactors(numbers[i]));
    }
    BIGL.forEach((subL) {
      subL.forEach((elem) {
        MEGA.add(elem);
      });
    });
    MEGA.forEach((cipars) {
      var tempo = [];
      BIGL.forEach((subL) {
        if (subL.isEmpty == false) {
          tempo.add(count(subL, cipars));
        }
      });
      //print(tempo);
      tempo.sort();
      res.add(pow(cipars,tempo.last));
      tempo = [];
    });
    //var ALL_ONE = [MEGA,res, BIGL]; for testing
    //int end_multiple = 1; // this will be end result
    res.forEach((element) {
      end_multiple *= element;
    });
    return end_multiple;
  } //--LCM of list

//-------------------------------------
  count(X, element) {
    //counter
    if (X.isEmpty || X == null) {
      return 0;
    }
    int C = 0;
    for (var i = 0; i < X.length; i++) {
      if (X[i] == element) {
        C++;
      }
    }
    return C;
  } //counter

//--------------------
  primefactors(X) {
    int D = 2;
    List<int> L = [];
    while (X > 1) {
      //print("${L},${D},X=${X}");
      if (X % D == 0) {
        L.add(D);
        X = X / D;
      } else {
        D = D + 1;
      } // else
    } // while
    return L; // return from primefactors()
  } //prime factors


  //----------------------------------------------------------------------

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
            // InkWell(
            //   // onTap: () {
            //   //   setState(() {
            //   //     _incrementCounter;
            //   //   });
            //   onTap: () {
            //     // ignore: unnecessary_statements
            //     _ZERO();
            //   },
            //   child: Container(
            //     width: 200.0,
            //     height: 70.0,
            //     margin: EdgeInsets.all(10.0),
            //     decoration: BoxDecoration(
            //         color: Colors.brown.withOpacity(0.3),
            //         borderRadius: BorderRadius.circular(7.0)),
            //     child: Center(
            //       child: Text(
            //         "0",
            //         style: TextStyle(
            //             color: Colors.deepOrange,
            //             fontSize: 60.0,
            //             fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ),
            // ),
            Text("$sumList", // The LIST in app!
            style: TextStyle(
              fontSize: 30,
            ),),
            //SizedBox(height: 10),
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
//----------------------------------------------------------------------------
          Center(
            child: Row(children: [
              InkWell(
                // onTap: () {
                //   setState(() {
                //     _incrementCounter;
                //   });
                onTap: () {
                  // ignore: unnecessary_statements
                  _addToList();
                },
                child: Container(
                  width: 150.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Center(
                    child: Text(
                      "add!",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              //--------2nd button--------------
              InkWell(
                // onTap: () {
                //   setState(() {
                //     _incrementCounter;
                //   });
                onTap: () {
                  // ignore: unnecessary_statements
                  _removeFromList();
                },
                child: Container(
                  width: 150.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Center(
                    child: Text(
                      "remove!",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],),
          ),
//-----------------------------------------------------------------------------
            SizedBox(height: 1),
//--------------------------------------------------------------
            Row(
              children: [
                InkWell(
                  onTap: () {
                    // ignore: unnecessary_statements
                    _incrementCounter();
                  },
                  child: Container(
                    width: 200.0,
                    height: 40.0,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.brown.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(7.0)),
                    child: Center(
                      child: Text(
                        "sum of list",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // ignore: unnecessary_statements
                    //_minusCounter();
                    _ZERO();
                  },
                  child: Container(
                    width: 150.0,
                    height: 40.0,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.brown.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(7.0)),
                    child: Center(
                      child: Text(
                        "sum=0",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 1),
            InkWell(
              onTap: () {
                // ignore: unnecessary_statements
                //_minusCounter();
                _showLMC();//This CHANE!!!!!!!!!!!
              },
              child: Container(
                width: 150.0,
                height: 40.0,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.brown.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(7.0)),
                child: Center(
                  child: Text(
                    "LCM",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
//-----------------------THe sum text-------------------------------------------
            Text(
              'The sum:',
              style: TextStyle(
                //color: _purple,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '$sumInt',
              style: TextStyle(
                //color: _purple,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(//LCM text ?
              '$end_multiple',
              style: TextStyle(
                //color: _purple,
                  fontSize: 50.0,
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
