import 'package:flutter/foundation.dart';

String? trim(String? input) {
  return input?.trim();
}

String? isNumeric(String? input) {
  return (input == null || int.tryParse(input) == null)
      ? "Must be numeric."
      : null;
}

String? correctLength(String? input) {
  return trim(input)?.length != 7 ? "Incorrect length." : null;
}
