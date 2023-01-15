import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CalcViewMode { highlightResult, highlightCalculation, justZero }

final calculationProvider = StateProvider((ref) => '');
final resultProvider = StateProvider((ref) => '0');
final calcViewModeProvider = StateProvider(
  (ref) => CalcViewMode.justZero,
);
