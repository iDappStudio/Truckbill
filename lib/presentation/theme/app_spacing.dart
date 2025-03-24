// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:truckbill/presentation/theme/app_dimens.dart';

class AppSpacing extends SizedBox {
  const AppSpacing.small() : super(height: AppDimens.s);
  const AppSpacing.medium() : super(height: AppDimens.m);
  const AppSpacing.large() : super(height: AppDimens.l);
  const AppSpacing.xLarge() : super(height: AppDimens.xxl);
}
