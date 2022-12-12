import 'package:flutter/foundation.dart';

String? trim(String? input) {
  return input?.trim();
}

String? isRequired(String? input) {
  return input?.trim() == "" ? "Required." : null;
}

String? isNumeric(String? input) {
  return (input == null || int.tryParse(input) == null)
      ? "Must be numeric."
      : null;
}

String? correctLength(String? input) {
  return trim(input)?.length != 7 ? "Must be seven digits." : null;
}
