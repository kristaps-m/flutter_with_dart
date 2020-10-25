import 'package:flutter/material.dart';
import "dart:math";

//import 'package:your_projectname/your_folder/IDCardClass.dart';
// import 'package:flutter_lmc_and_other/lib/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application! Only whole numbers"),
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextInputPlace(),
          //TEST(),
          //ButtonsForList(),
          //FirstColumn(),
          //SecondColumn(),
        ],
      ),
    );
  }
}

//-------------First-------------------------------------------
class TextInputPlace extends StatefulWidget {
  @override
  _TextInputPlaceState createState() => _TextInputPlaceState();
}

class _TextInputPlaceState extends State<TextInputPlace> {
  int intToList = 0;
  var theList = [];
  int end_multiple = 1; //show end result for LCM
  int endMultiShow = 1; // shows end muliple
  int sumInt = 0;
  double fontSizeLetters = 30.0;
  var bColor = Colors.green;

  void _incrementCounter() {
    setState(() {
      //_counter= _counter + _billAmount;// + _billAmount2;
      theList.forEach((element) {
        sumInt += element;
      });
      print("$sumInt Hi this is sumInt");
    });
  }

  void _multiAllTotal(){
    setState(() {
      theList.forEach((element) {
        endMultiShow *= element;
      });
    });
  }

  void _removeFromList() {
    setState(() {
      theList.removeLast();
    });
  }

  void _ZERO() {
    setState(() {
      //_counter= 0;
      sumInt = 0;
      theList = [];
      end_multiple = 1;
      endMultiShow = 1;
    });
  }

  void _resetNumbers() {
    setState(() {
      //_counter= 0;
      sumInt = 0;
      end_multiple = 1;
      endMultiShow = 1;
    });
  }

  void _addToList() {
    setState(() {
      theList.add(intToList);
    });
  }

  void _showLMC() {
    setState(() {
      lcm_of_list(theList);
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
      res.add(pow(cipars, tempo.last));
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
    X = X.abs();
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
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Sum:  ',
                style: TextStyle(
                  //color: _purple,
                    fontSize: fontSizeLetters,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '$sumInt',
                style: TextStyle(
                  //color: _purple,
                    fontSize: fontSizeLetters,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),

          Row(
            children: [
              Text("LCM:  ",
              style: TextStyle(
                fontSize: fontSizeLetters,
                fontWeight: FontWeight.bold
              ),),
              Text(//LCM text ?
                '$end_multiple',
                style: TextStyle(
                  //color: _purple,
                    fontSize: fontSizeLetters,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Text("Multi:  ",
                style: TextStyle(
                    fontSize: fontSizeLetters,
                    fontWeight: FontWeight.bold
                ),),
              Text(//Multi text ?
                '$endMultiShow',
                style: TextStyle(
                  //color: _purple,
                    fontSize: fontSizeLetters,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text("$theList", // The LIST in app!
            style: TextStyle(
              fontSize: fontSizeLetters,
            ),),
          //Text("$testString"),
          TextField(
            style: TextStyle(
              fontSize: 20,
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: (String value) {
              try {
                intToList = int.parse(value);
              } catch (exception) {
                intToList = 0;
              }
            },
          ),
          //-----4 buttons
          Row(
            children: [
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
                  width: 100.0,
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
                  width: 100.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Center(
                    child: Text(
                      "del",
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
                  width: 100.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Center(
                    child: Text(
                      "CE",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
//-----------------------------------------------------------------------------
          SizedBox(height: 1),
//-----------------------------2nd ROW---------------------------------
          Row(
            children: [
              InkWell(
                onTap: () {
                  // ignore: unnecessary_statements
                  _incrementCounter();
                },
                child: Container(
                  width: 100.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Center(
                    child: Text(
                      "Sum",
                      style: TextStyle(
                          color: bColor,
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
                  _showLMC();//This CHANE!!!!!!!!!!!
                },
                child: Container(
                  width: 110.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Center(
                    child: Text(
                      "LCM",
                      style: TextStyle(
                          color: bColor,
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
                  _multiAllTotal();
                  print("$endMultiShow");
                },
                child: Container(
                  width: 110.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Center(
                    child: Text(
                      "Multi",
                      style: TextStyle(
                          color: bColor,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(// 3 ---- THIRD ROW buttons ----3-------------------------
            children: [
              InkWell(
                onTap: () {
                  // ignore: unnecessary_statements
                  //_minusCounter();
                  _resetNumbers();
                  print("$endMultiShow");
                },
                child: Container(
                  width: 250.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Center(
                    child: Text(
                      "reset results",
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
        ],
      ),
    );
  }
}
