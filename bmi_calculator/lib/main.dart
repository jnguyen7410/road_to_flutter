import 'package:flutter/material.dart';
import 'input_page.dart';
import 'results_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF090C22),
          scaffoldBackgroundColor: Color(0xFF090C22),
          backgroundColor: Color(0xFF090C22),
          // accentColor: Color(0xFFEA1556),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => InputPage(),
          '/results': (context) => ResultsPage(),
        });
  }
}
