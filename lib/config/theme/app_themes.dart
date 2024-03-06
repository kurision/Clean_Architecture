import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color.fromARGB(255, 222, 174, 174)),
    titleTextStyle: TextStyle(
        color: Color.fromARGB(255, 206, 174, 174),
        fontSize: 24,
        fontWeight: FontWeight.bold),
  );
}
