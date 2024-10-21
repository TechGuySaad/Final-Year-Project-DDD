
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter/material.dart';

// class Utils {

//   void toastMessage(String message , String color ){

//     Fluttertoast.showToast(

//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16
//     );
//   }

// }

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {

  // Function to show a toast message
  void toastMessage(String message, String color) {

    // Convert the string color to a Flutter Color object
    Color? backgroundColor = getColorFromName(color);

    // Show the toast message
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? Colors.red, 
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // Function to map string color names to Flutter Color objects
  Color? getColorFromName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      default:
        return null; // Return null if the color is not recognized
    }
  }
}
