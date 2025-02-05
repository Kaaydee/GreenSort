import 'package:flutter/material.dart';

class PointsProvider extends ChangeNotifier {
  int _points = 0;

  int get points => _points;

  void addPoints(int value) {
    _points += value;
    notifyListeners();
  }
}
