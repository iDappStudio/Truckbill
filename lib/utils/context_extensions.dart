import 'package:flutter/material.dart';
import 'package:truckbill/generated/l10n.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  S get s => S.of(this);
}
