import 'package:flutter/material.dart';
import 'package:calculator_dummy/components/keypad_key.dart';
import 'package:calculator_dummy/helpers.dart';

class Keypad extends StatelessWidget {
  const Keypad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey.shade400,
          indent: 30,
          endIndent: 30,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KeypadKey('AC', KeyType.ACKey),
                  KeypadKey('7', KeyType.numericKey, key: Key('7_Button')),
                  KeypadKey('4', KeyType.numericKey, key: Key('4_Button')),
                  KeypadKey('1', KeyType.numericKey, key: Key('1_Button')),
                  KeypadKey('', KeyType.emptyKey),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KeypadKey('', KeyType.clearKey, key: Key('removeButton')),
                  KeypadKey('8', KeyType.numericKey, key: Key('8_Button')),
                  KeypadKey('5', KeyType.numericKey, key: Key('5_Button')),
                  KeypadKey('2', KeyType.numericKey, key: Key('2_Button')),
                  KeypadKey('0', KeyType.numericKey, key: Key('0_Button')),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KeypadKey('%', KeyType.percentageKey),
                  KeypadKey('9', KeyType.numericKey, key: Key('9_Button')),
                  KeypadKey('6', KeyType.numericKey, key: Key('6_Button')),
                  KeypadKey('3', KeyType.numericKey, key: Key('3_Button')),
                  KeypadKey('.', KeyType.dotKey),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KeypadKey('÷', KeyType.divisionKey),
                  KeypadKey('×', KeyType.symbolKey),
                  KeypadKey('-', KeyType.minusKey),
                  KeypadKey('+', KeyType.symbolKey),
                  KeypadKey('=', KeyType.equalsKey),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 40)
      ],
    );
  }
}
