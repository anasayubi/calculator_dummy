import 'package:flutter/material.dart';
import 'package:calculator_dummy/components/calculation_and_results_area.dart';
import 'package:calculator_dummy/components/keypad.dart';
import 'package:calculator_dummy/helpers.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [CalculationAndResultsArea(), Keypad()],
      ),
    );
  }
}
