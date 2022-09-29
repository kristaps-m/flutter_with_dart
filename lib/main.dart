import 'package:flutter/material.dart';
import 'package:test_app_calculations_2_files/calculations.dart';
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
      debugShowCheckedModeBanner: false,
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
  int endGCD = 1; //show end result for GCD
  int sumInt = 0;
  double fontSizeLetters = 30.0;
  var bColor = Colors.green;
  double buttonHeight = 40.0;
  double buttonWight = 80.0; // width


//---------------LMC stuff---------------------------------------------------
  //-----------lcm_of_list--------------------------
  lcm_of_list(numbers) {
    List L = theEndList(numbers);
    //int end_multiple = 1; //Adding this here wil cause LCM always be 1
    L.forEach((element) {
      end_multiple *= element;
    });
    return end_multiple;
  } //--LCM of list
  //---------theEndList(List X)----------------
//-------------COUNT------------------------
//--------primefactors----------

  //-----------------GCD---------------------
  GCD(X) {
    endGCD = GCD_of_list(X);
    return endGCD;
  }
  //----------------------------------------
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
          Row(
            children: [
              Text("GCD:  ",
                style: TextStyle(
                    fontSize: fontSizeLetters,
                    fontWeight: FontWeight.bold
                ),),
              Text(//Multi text ?
                '$endGCD', // need change GCD
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
            decoration: InputDecoration(
              hintText: "Enter whole number, click add! (to list)"
            ),
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
                  width: buttonWight, // buttonWight
                  height: buttonHeight, // buttonHeight
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
                  width: buttonWight, // buttonWight
                  height: buttonHeight, // buttonHeight
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
                  width: buttonWight, // buttonWight
                  height: buttonHeight, // buttonHeight
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
                  width: buttonWight, // buttonWight
                  height: buttonHeight, // buttonHeight
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
                  width: buttonWight, // buttonWight
                  height: buttonHeight, // buttonHeight
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
                },
                child: Container(
                  width: buttonWight, // buttonWight
                  height: buttonHeight, // buttonHeight
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Center(
                    child: Text(
                      "Multi",
                      style: TextStyle(
                          color: bColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ) // Multi
            ],
          ),
          Row(// 3 ---- THIRD ROW buttons ----3-------------------------
            children: [
              InkWell(
                onTap: () {
                  // ignore: unnecessary_statements
                  //_minusCounter();
                  _showGCD();
                },
                child: Container(
                  width: buttonWight, // buttonWight
                  height: buttonHeight, // buttonHeight
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Center(
                    child: Text(
                      "GCD",
                      style: TextStyle(
                          color: bColor,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ), // GCD
              InkWell(
                onTap: () {
                  // ignore: unnecessary_statements
                  //_minusCounter();
                  _resetNumbers();;
                },
                child: Container(
                  width: 180.0,
                  height: buttonHeight,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Center(
                    child: Text(
                      "reset results",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 25.0,
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
  void _incrementCounter() {
    setState(() {
      //_counter= _counter + _billAmount;// + _billAmount2;
      theList.forEach((element) {
        sumInt += element;
      });
    });
  }

  void _multiAllTotal(){ //multiply all
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
      end_multiple = 1; // LCM result!
      endMultiShow = 1;
      endGCD = 1; // GCD
    });
  }

  void _resetNumbers() {
    setState(() {
      //_counter= 0;
      sumInt = 0;
      end_multiple = 1;
      endMultiShow = 1;
      endGCD =1;
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
      //end_multiple;
    });
  }

  void _showGCD() {
    setState(() {
      GCD(theList);
      //end_multiple;
    });
  }

}// don't cut his out