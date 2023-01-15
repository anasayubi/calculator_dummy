import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_dummy/helpers.dart';
import 'package:calculator_dummy/providers.dart';

class CalculationAndResultsArea extends ConsumerWidget {
  CalculationAndResultsArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
        child: Consumer(
          builder: (context, ref, _) {
            final result = ref.watch(resultProvider);
            final calculation = ref.watch(calculationProvider);
            final calcViewMode = ref.watch(calcViewModeProvider);

            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Calculation area
                if (calcViewMode != CalcViewMode.justZero)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        calculation,
                        style: calcViewMode == CalcViewMode.highlightCalculation
                            ? TextStyle(fontSize: 55, color: blackColor)
                            : calcViewMode == CalcViewMode.highlightResult
                                ? TextStyle(fontSize: 35, color: greyShade)
                                // justZero value - does not reach anyway
                                : null,
                      ),
                    ],
                  ),
                // Results Area
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        result,
                        style: calcViewMode == CalcViewMode.highlightCalculation
                            ? TextStyle(fontSize: 35, color: greyShade)
                            : calcViewMode == CalcViewMode.highlightResult
                                ? TextStyle(fontSize: 55, color: blackColor)
                                //  justZero value
                                : TextStyle(fontSize: 55, color: blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
