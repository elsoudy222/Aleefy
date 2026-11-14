import 'package:flutter/foundation.dart';

void logMe(String message) {
  if (kDebugMode) {
    debugPrint(message);
  }
}
