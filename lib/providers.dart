import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CalcViewMode { highlightResult, highlightCalculation, justZero }

// The state machine of the calculator
enum CalcState { zeroState, numericState, symbolState }

final calculationProvider = StateProvider((ref) => '');
final resultProvider = StateProvider((ref) => '0');
final calcViewModeProvider = StateProvider((ref) => CalcViewMode.justZero);
final decimalDotInsertableProvider = StateProvider((ref) => true);

// Current state in the calculator state machine
final calcStateProvider = StateProvider((ref) => CalcState.zeroState);
