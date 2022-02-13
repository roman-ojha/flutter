import 'package:flutter/foundation.dart';

class TimerInfo extends ChangeNotifier {
  int _remainingTimer = 60;
  int getRemainingTimer() => _remainingTimer;
  // to get the value
  updateRemainingTime() {
    _remainingTimer--;
    notifyListeners();
    // after updating value we have to call this function
  }
}
