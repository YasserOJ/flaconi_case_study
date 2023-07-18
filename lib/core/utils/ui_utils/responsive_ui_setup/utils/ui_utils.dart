import 'package:flaconi_case_study/core/utils/ui_utils/responsive_ui_setup/enums/device_screen_type.dart';
import 'package:flutter/material.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQueryData) {
  final double deviceWidth = mediaQueryData.size.shortestSide;

  ///this method is provided by more than article but if you have a better way to differ device types just inform me please
  if (deviceWidth > 550) {
    return DeviceScreenType.tablet;
  }

  return DeviceScreenType.mobile;
}
