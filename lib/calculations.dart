// import 'package:flutter/material.dart';
// import 'package:flutter_lmc_and_other/main.dart';
import "dart:math";
//------------------------GCD--------------------------------
GCD_of_list(numbers) {
  var BIGL = [];
  Set MEGA = new Set();
  var uthere = [];
  var listFinal = [];
  //---------------
  var res = [];
  int C = 0;
  //-----------------
  numbers.forEach((e) => C += 1); //lenght of numbers
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
  var ALL_ONE = [MEGA, res, BIGL]; // for testing
  //print(ALL_ONE);
  //-------------------------------------------------
  MEGA.forEach((element) {
    var Cnums = [];
    BIGL.forEach((subList) {
      if (subList.contains(element)) {
        uthere.add(1);
      } else {
        uthere.add(0);
      }
    });
    if (uthere.every((isOne) => isOne == 1)) {
      Cnums = [
        for (var i = 0; i < BIGL.length; i += 1) count(BIGL[i], element)
      ];
      Cnums.sort();
      int CnumsTheNum = Cnums.first;
      listFinal.add(pow(element, CnumsTheNum));
      // List tempList = [];
      // BIGL.forEach((miniL) {
      //   tempList.add(count(miniL, element));
      //   tempList.sort();
      //   Cnums = tempList.first;
      //   print("Before append $listFinal");
      //   listFinal.add(pow(element,Cnums));
      //   print("AFTER $listFinal");
      //});
    }
    uthere = [];
  });

  int end_multiple_GCD = 1; // this will be end result
  if (listFinal.length > 0) {
    listFinal.forEach((element) {
      end_multiple_GCD *= element;
    });
    return end_multiple_GCD;
  } else {
    return 1;
  }

  //return listFinal;
} //--GCD of list



//-------------------------------------
//----------------------------------------
theEndList(List X){ // LCM
  //print(numbers);
  List BIGL = [];
  Set MEGA = new Set();
  var res = [];
  int C = 0;
  // print();
  X.forEach((e) => C += 1);
  for (int i = 0; i < C; i++) {
    //print("${C}<><><${i}---${numbers[i]}");
    BIGL.add(primefactors(X[i]));
  }
  BIGL.forEach((subL) {
    subL.forEach((elem) {
      MEGA.add(elem);
    });
  });
  //return MEGA;
  //[2,2,2,3,3,3], [2,3,3]
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
  print("this is res from 2nd page = $res");
  return res;
  //var ALL_ONE = [MEGA,res, BIGL]; for testing
}
//-------------------------------------
//------------------------------------
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
//--------------------------------------
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