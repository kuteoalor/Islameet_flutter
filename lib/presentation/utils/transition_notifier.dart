import 'package:flutter/material.dart';

class TransitionNotifier with ChangeNotifier {
  bool _transition = false;

  bool get transition => _transition;

  void transit() {
    _transition = true;
    notifyListeners();
  }
}
