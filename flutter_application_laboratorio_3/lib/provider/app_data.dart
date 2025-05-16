import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  String _username = "Invitado";
  bool _resetEnabled = true;

  int get counter => _counter;
  String get username => _username;
  bool get resetEnabled => _resetEnabled;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  void reset() {
    if (_resetEnabled) {
      _counter = 0;
      notifyListeners();
    }
  }

  void setUsername(String name) {
    _username = name;
    notifyListeners();
  }

  void toggleReset(bool value) {
    _resetEnabled = value;
    notifyListeners();
  }
}