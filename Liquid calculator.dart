import 'package:flutter/material.dart';
import "dart:math";

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
        title: Text("Application! Fluid"),
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextInputPlace(),
        ],
      ),
    );
  }
}
//-----------------------------------------------------------------------

class TextInputPlace extends StatefulWidget {
  @override
  _TextInputPlaceState createState() => _TextInputPlaceState();
}

class _TextInputPlaceState extends State<TextInputPlace> {
  double fontSizeLetters = 30.0;
  var bColor = Colors.green;
  double buttonHeight = 40.0;
  double buttonWight = 80.0; // width
  //---------------------
  double doubleVolToList = 0.0;
  double doublePercentToList = 0.0;
  double theEndResult = 0;
  List theList = [];
  List showEndList = [];

  //-------------------------------
  double V = 0.0;
  double P = 0.0;

//-----------------------------------------------
  String showString = "Liquids: ";
  int C = 0;

  //----------------------------------------
  showResult(List Y) {
    var L = calculateResult(Y);
    showEndList = L;
    print(showEndList);
    //double.parse((12.3412).toStringAsFixed(2));
    V = double.parse((showEndList[0]).toStringAsFixed(2));
    P = double.parse((showEndList[1]).toStringAsFixed(2));
    return [V, P];
  }

  calculateResult(List X) {
    var endVolume = 0.0;
    var endPersentage = 0.0;
    var pureLiquid = 0.0;
    List endResultList = [];
    //var X = [[1,50],[0.5,5]];
//   X.add([1,80]);
//   X.add([0.75,13]);
    for (int i = 0; i < X.length; i++) {
      var subList = X[i];
      var vol = subList[0];
      var proc = subList[1];
      //print("int loop = $vol, $proc, $endVolume, $pureLiquid");
      endVolume += vol;
      pureLiquid += vol * (proc / 100);
      //endPersentage =
    } // for loop
    endPersentage = (pureLiquid / endVolume) * 100;
    endResultList = [endVolume, endPersentage];
    print("$endVolume, $endPersentage");
    // doubleVolToList = 0.0;
    // doublePercentToList = 0.0;
    return endResultList;
  } // calculateResult

//------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'result:  ',
            style: TextStyle(
                //color: _purple,
                fontSize: fontSizeLetters,
                fontWeight: FontWeight.bold),
          ),
          RichText(
            text: TextSpan(
              text: 'Volume: ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSizeLetters,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '$V',
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: fontSizeLetters,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Percentage: ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSizeLetters,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '$P',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: fontSizeLetters,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 10,
            color: Colors.blue,
          ),
          Text(
            "$showString", // The LIST in app! $theList
            style: TextStyle(
              fontSize: fontSizeLetters,
            ),
          ),
          //Text("$testString"),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Flexible(
                  child: new TextField(
                decoration: InputDecoration(hintText: "Volume"),
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (String value) {
                  try {
                    doubleVolToList = double.parse(value);
                  } catch (exception) {
                    doubleVolToList = 0;
                  }
                },
              )),
              SizedBox(
                width: 20.0,
              ),
              new Flexible(
                child: new TextField(
                  decoration: InputDecoration(hintText: "Percentage"),
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (String value) {
                    try {
                      doublePercentToList = double.parse(value);
                    } catch (exception) {
                      doublePercentToList = 0;
                    }
                  },
                ),
              ),
              SizedBox(
                width: 20.0,
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
              ),
              InkWell(
                onTap: () {
                  // ignore: unnecessary_statements
                  _addToList();
                },
                child: Container(
                  width: buttonWight,
                  // buttonWight
                  height: buttonHeight,
                  // buttonHeight
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
              InkWell(
                onTap: () {
                  _removeFromList();
                },
                child: Container(
                  width: buttonWight,
                  // buttonWight
                  height: buttonHeight,
                  // buttonHeight
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Center(
                    child: Text(
                      "del!",
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
          InkWell(
            onTap: () {
              // ignore: unnecessary_statements
              //_incrementCounter();
              _showResultFromList();
            },
            child: Container(
              width: 180,
              // buttonWight
              height: buttonHeight,
              // buttonHeight
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.brown.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(7.0)),
              child: Center(
                child: Text(
                  "Result",
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
              _ZERO();
            },
            child: Container(
              width: 120.0,
              height: buttonHeight,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.brown.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(7.0)),
              child: Center(
                child: Text(
                  "reset all",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addToList() {
    setState(() {
      theList.add([
        doubleVolToList,
        (doublePercentToList >= 100) ? 100 : doublePercentToList
      ]);
      C++;
      showString +=
          "V$C=$doubleVolToList, P$C=${(doublePercentToList >= 100) ? 100 : doublePercentToList} & \n";
    });
  }

  void _removeFromList() {
    setState(() {
      theList.removeLast();
      C--;
      int cDel = 1;
      showString = "Liquids: ";
      theList.forEach((element) {
        var a = element[0];
        var b = element[1];
        showString += "V$cDel=$a, P$cDel=${(b >= 100) ? 100 : b} & \n";
        cDel++;
      });
    });
  }

  void _ZERO() {
    setState(() {
      //_counter= 0;
      // doubleVolToList = 0.0;
      // doublePercentToList = 0.0;
      theList = [];
      showEndList = [];
      showString = "Liquids: ";
      V = 0.0;
      P = 0.0;
      C = 0;
    });
  }

  void _showResultFromList() {
    setState(() {
      showResult(theList);
      //end_multiple;
    });
  }

  double roundDouble(double value, int places) {
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
} //class _TextInputPlaceState
