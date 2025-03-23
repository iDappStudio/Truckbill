import 'package:flutter/material.dart';
import 'package:truckbill/generated/l10n.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension ColorSchemeExtension on BuildContext {
  ColorScheme get colors => theme.colorScheme;
}


extension LocalizationExtension on BuildContext {
  S get s => S.of(this);
}