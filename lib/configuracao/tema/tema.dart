import 'package:flutter/material.dart';

class Tema {
  static ThemeData get temaClaro {
    return ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat', //3
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.blueAccent[50],
        ));
  }

  static ThemeData get temaEscuro {
    return ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat', //3
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.blueAccent[50],
        ));
  }
}
