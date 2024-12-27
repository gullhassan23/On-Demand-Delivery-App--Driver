import 'package:flutter/widgets.dart';

extension OnInt on int {
  SizedBox get vertical => SizedBox(height: toDouble());
  SizedBox get horizontal => SizedBox(width: toDouble());
}
