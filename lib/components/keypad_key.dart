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

    switch (keyType) {
      case KeyType.ACKey:
        selectedFontSize = 25;
        selectedTextColor = orangeColor;
        selectedFontWeight = FontWeight.w500;
        break;
      case KeyType.numericKey:
        selectedFontSize = 35;
        selectedTextColor = blackColor;
        onTapFunc = () {
          ref.read(calculationProvider.notifier).state = text;
          ref.read(resultProvider.notifier).state = "=$text";
          ref.read(calcViewModeProvider.notifier).state =
              CalcViewMode.highlightCalculation;
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
        break;
      case KeyType.minusKey:
        selectedFontSize = 87;
        selectedTextColor = orangeColor;
        selectedFontWeight = FontWeight.w200;
        selectedLineHeight = 0.84;
        break;
      case KeyType.symbolKey:
        selectedFontSize = 42;
        selectedTextColor = orangeColor;
        selectedFontWeight = FontWeight.w300;
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
        // onPressed: () {},
        onPressed: onTapFunc,
        onLongPress: null,
        child: Text(text),
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
      );
    }
  }
}
