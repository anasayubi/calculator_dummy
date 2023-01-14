import 'package:flutter/material.dart';
import 'package:calculator_dummy/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ViewMode { highlightResult, highlightCalculation, justZero }

class CalculationAndResultsArea extends StatelessWidget {
  var viewMode = ViewMode.justZero;

  CalculationAndResultsArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (viewMode != ViewMode.justZero)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "9x9",
                    style: viewMode == ViewMode.highlightCalculation
                        ? TextStyle(fontSize: 55, color: blackColor)
                        : viewMode == ViewMode.highlightResult
                            ? TextStyle(fontSize: 35, color: greyShade)
                            // justZero value
                            : null,
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '0',
                    style: viewMode == ViewMode.highlightCalculation
                        ? TextStyle(fontSize: 35, color: greyShade)
                        : viewMode == ViewMode.highlightResult
                            ? TextStyle(fontSize: 55, color: blackColor)
                            //  justZero value
                            : TextStyle(fontSize: 55, color: blackColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
