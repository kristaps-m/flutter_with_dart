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
  double V =0.0;
  double P=0.0;
//-----------------------------------------------
  showResult(List Y){
    var L = calculateResult(Y);
    showEndList = L;
    print(showEndList);
    //double.parse((12.3412).toStringAsFixed(2));
    V = double.parse((showEndList[0]).toStringAsFixed(2));
    P = double.parse((showEndList[1]).toStringAsFixed(2));
    return [V,P];
  }

  calculateResult(List X){
    var endVolume = 0.0;
    var endPersentage =0.0;
    var pureLiquid = 0.0;
    List endResultList = [];
    //var X = [[1,50],[0.5,5]];
//   X.add([1,80]);
//   X.add([0.75,13]);
    for(int i=0;i<X.length;i++){
      var subList = X[i];
      var vol = subList[0];
      var proc = subList[1];
      print("int loop = $vol, $proc, $endVolume, $pureLiquid");
      endVolume += vol;
      pureLiquid += vol * (proc/100);
      //endPersentage =

    }
    endPersentage = (pureLiquid/endVolume)*100;
    endResultList = [endVolume,endPersentage];
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
          Row(
            children: [
              Text(
                'result:  ',
                style: TextStyle(
                  //color: _purple,
                    fontSize: fontSizeLetters,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Volume = $V, Percentage = $P',
                style: TextStyle(
                  //color: _purple,
                    fontSize: fontSizeLetters,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Text("$theList", // The LIST in app!
            style: TextStyle(
              fontSize: fontSizeLetters,
            ),),
          //Text("$testString"),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  decoration: InputDecoration(
                      hintText: "Enter volume"
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),

                  onChanged: (String value) {
                    try {
                      doubleVolToList = double.parse(value);
                    } catch (exception) {
                      doubleVolToList = 0;
                    }
                  },
                )
              ),
              SizedBox(width: 20.0,),
              new Flexible(
                child: new TextField(
                  decoration: InputDecoration(
                      hintText: "Enter percentage"
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),

                  onChanged: (String value) {
                    try {
                      doublePercentToList= double.parse(value);
                    } catch (exception) {
                      doublePercentToList= 0;
                    }
                  },
                ),
              ),
              SizedBox(width: 20.0,)
            ],
          ),
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
          InkWell(
            onTap: () {
              // ignore: unnecessary_statements
              //_minusCounter();
              _ZERO();
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
                  "reset all",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // ignore: unnecessary_statements
              //_incrementCounter();
              _showResultFromList();
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
                  "Result",
                  style: TextStyle(
                      color: bColor,
                      fontSize: 35.0,
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
      //double.parse((12.3412).toStringAsFixed(2)); doublePercentToList
      theList.add([doubleVolToList,doublePercentToList]);
      //theList.add([double.parse((doubleVolToList).toStringAsFixed(2)),
      //double.parse((doublePercentToList).toStringAsFixed(2))]);

    });
  }

  void _ZERO() {
    setState(() {
      //_counter= 0;
      // doubleVolToList = 0.0;
      // doublePercentToList = 0.0;
      theList = [];
      showEndList = [];
    });
  }

  void _showResultFromList() {
    setState(() {
      showResult(theList);
      //end_multiple;
    });
  }
  double roundDouble(double value, int places){ 
   double mod = pow(10.0, places); 
  return ((value * mod).round().toDouble() / mod); 
  }
} //class _TextInputPlaceState
