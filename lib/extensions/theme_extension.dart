import 'package:flutter/material.dart';

extension Context on BuildContext {
  ThemeData get theme => Theme.of(this);
}