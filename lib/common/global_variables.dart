import 'package:flutter/material.dart';

class GlobalVariables{
  static const appBarGradient = LinearGradient(colors: [
    Color.fromARGB(255, 13, 12, 29),
    Color.fromARGB(255, 108, 99, 255)
  ],
  stops: [0.5,1.0]
  );
  
static const secondaryColor = Color.fromARGB(255, 157, 157, 158);

static const backgroundColor =     Color.fromARGB(255, 13, 12, 29);

static const Color greyBackgroundColor = Color.fromARGB(255, 73, 62, 71);

static var selectedNavBarColor = const Color.fromARGB(228, 192, 143, 192);

static const unselectedNavbarColor = Color.fromARGB(237, 27, 26, 26);
}
