import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:calculator_dummy/helpers.dart';
import 'package:calculator_dummy/providers.dart';

class KeypadKey extends ConsumerWidget {
  final String text;
  final KeyType keyType;

  const KeypadKey(this.text, this.keyType, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color? selectedTextColor;
    double? selectedFontSize;
    FontWeight? selectedFontWeight;
    double? selectedLineHeight;
    VoidCallback? onTapFunc = () {};
    // For all symbols - kept seperate because will be appied on: mult, div, plus and minus
    onTapFuncSymbols() {
      CalcState calcState = ref.read(calcStateProvider.notifier).state;

      if (calcState == CalcState.numericState) {
        ref.read(calculationProvider.notifier).state += text;
        ref.read(calcStateProvider.notifier).state = CalcState.symbolState;
        // A decimal point can be inserted after this
        ref.read(decimalDotInsertableProvider.notifier).state = true;
      }

      // Replace symbol if still in symbol state with the clicked symbol
      if (calcState == CalcState.symbolState) {
        String calculation = ref.read(calculationProvider.notifier).state;
        String calculationLastCharRemoved =
            calculation.substring(0, calculation.length - 1);
        ref.read(calculationProvider.notifier).state =
            calculationLastCharRemoved + text;
        // A decimal point can be inserted after this
        ref.read(decimalDotInsertableProvider.notifier).state = true;
      }
    }

    switch (keyType) {
      case KeyType.ACKey:
        selectedFontSize = 25;
        selectedTextColor = orangeColor;
        selectedFontWeight = FontWeight.w500;
        onTapFunc = () {
          ref.read(calculationProvider.notifier).state = '0';
          ref.read(calcStateProvider.notifier).state = CalcState.zeroState;
          ref.read(calcViewModeProvider.notifier).state = CalcViewMode.justZero;
          // A decimal point can be inserted after this
          ref.read(decimalDotInsertableProvider.notifier).state = true;
        };
        break;
      case KeyType.numericKey:
        selectedFontSize = 35;
        selectedTextColor = blackColor;
        onTapFunc = () {
          CalcState calcState = ref.read(calcStateProvider.notifier).state;

          // On pressing '0' nothing happens - remains in zero state
          if (calcState == CalcState.zeroState && text != '0') {
            ref.read(calculationProvider.notifier).state = text;
            // ref.read(resultProvider.notifier).state = "=$text";
            ref.read(calcViewModeProvider.notifier).state =
                CalcViewMode.highlightCalculation;
            ref.read(calcStateProvider.notifier).state = CalcState.numericState;
          }

          // 0s can be typed in now in this state
          if (calcState == CalcState.numericState ||
              calcState == CalcState.symbolState) {
            ref.read(calculationProvider.notifier).state += text;
            ref.read(calcStateProvider.notifier).state = CalcState.numericState;
          }
        };
        break;
      case KeyType.percentageKey:
        selectedFontSize = 30;
        selectedTextColor = orangeColor;
        selectedFontWeight = FontWeight.w500;
        break;
      case KeyType.divisionKey:
        selectedFontSize = 45;
        selectedTextColor = orangeColor;
        selectedFontWeight = FontWeight.w300;
        onTapFunc = onTapFuncSymbols;
        break;
      case KeyType.minusKey:
        selectedFontSize = 87;
        selectedTextColor = orangeColor;
        selectedFontWeight = FontWeight.w200;
        selectedLineHeight = 0.84;
        onTapFunc = onTapFuncSymbols;
        break;
      case KeyType.symbolKey:
        selectedFontSize = 42;
        selectedTextColor = orangeColor;
        selectedFontWeight = FontWeight.w300;
        onTapFunc = onTapFuncSymbols;
        break;
      case KeyType.equalsKey:
        selectedFontSize = 55;
        selectedTextColor = whiteColor;
        selectedFontWeight = FontWeight.w300;
        selectedLineHeight = 1.11;
        break;
      case KeyType.dotKey:
        selectedFontSize = 37;
        selectedTextColor = blackColor;
        onTapFunc = () {
          CalcState calcState = ref.read(calcStateProvider.notifier).state;
          bool decimalDotInsertable =
              ref.read(decimalDotInsertableProvider.notifier).state;

          if (decimalDotInsertable) {
            if (calcState == CalcState.numericState ||
                calcState == CalcState.symbolState) {
              ref.read(calculationProvider.notifier).state += '.';
              ref.read(calcStateProvider.notifier).state =
                  CalcState.numericState;
            }

            if (calcState == CalcState.zeroState) {
              ref.read(calculationProvider.notifier).state = '0.';
              ref.read(calcViewModeProvider.notifier).state =
                  CalcViewMode.highlightCalculation;
              ref.read(calcStateProvider.notifier).state =
                  CalcState.numericState;
            }

            // decimal dot not insertable anymore
            ref.read(decimalDotInsertableProvider.notifier).state = false;
          }
        };
        break;
      case KeyType.emptyKey:
        selectedFontSize = 30;
        selectedTextColor = orangeColor;
        onTapFunc = null;
        break;
      // KeyType.clearKey case where these values are not used
      default:
    }

    if (keyType == KeyType.clearKey) {
      return InkResponse(
        onTap: () {},
        radius: 37.5,
        child: SizedBox(
          height: 75,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(31, 26, 34, 26),
            child: Ink.image(
              fit: BoxFit.contain,
              image: const AssetImage('assets/clearIcon.png'),
            ),
          ),
        ),
      );
    }
    // In case of all other type of keys
    else {
      return TextButton(
        onPressed: onTapFunc,
        onLongPress: null,
        style: TextButton.styleFrom(
          fixedSize: Size.fromHeight(75),
          shape: CircleBorder(),
          backgroundColor: keyType == KeyType.equalsKey ? orangeColor : null,
          foregroundColor: selectedTextColor,
          textStyle: TextStyle(
            fontSize: selectedFontSize,
            fontWeight: selectedFontWeight,
            height: selectedLineHeight,
          ),
        ),
        // If not an AC key then just show text. In case AC key then text will
        //  be determined based on state
        child: (keyType != KeyType.ACKey)
            ? Text(text)
            // If AC key type
            : Consumer(builder: (context, ref, _) {
                final calcState = ref.watch(calcStateProvider);
                if (calcState == CalcState.zeroState) {
                  return Text('AC');
                } else {
                  return Text('C');
                }
              }),
      );
    }
  }
}
