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
                  KeypadKey('AC', KeyType.ACKey, key: Key('acButton')),
                  KeypadKey('7', KeyType.numericKey, key: Key('7_button')),
                  KeypadKey('4', KeyType.numericKey, key: Key('4_button')),
                  KeypadKey('1', KeyType.numericKey, key: Key('1_button')),
                  KeypadKey('', KeyType.emptyKey),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KeypadKey('', KeyType.clearKey, key: Key('removeButton')),
                  KeypadKey('8', KeyType.numericKey, key: Key('8_button')),
                  KeypadKey('5', KeyType.numericKey, key: Key('5_button')),
                  KeypadKey('2', KeyType.numericKey, key: Key('2_button')),
                  KeypadKey('0', KeyType.numericKey, key: Key('0_button')),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KeypadKey('%', KeyType.percentageKey),
                  KeypadKey('9', KeyType.numericKey, key: Key('9_button')),
                  KeypadKey('6', KeyType.numericKey, key: Key('6_button')),
                  KeypadKey('3', KeyType.numericKey, key: Key('3_button')),
                  KeypadKey('.', KeyType.dotKey, key: Key('dotButton')),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KeypadKey(
                    '÷',
                    KeyType.divisionKey,
                    key: Key('divButton'),
                  ),
                  KeypadKey('×', KeyType.symbolKey, key: Key('multButton')),
                  KeypadKey('-', KeyType.minusKey, key: Key('minusButton')),
                  KeypadKey('+', KeyType.symbolKey, key: Key('plusButton')),
                  KeypadKey('=', KeyType.equalsKey, key: Key('equalsButton')),
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
