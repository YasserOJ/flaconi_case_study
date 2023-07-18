import 'package:flaconi_case_study/core/utils/ui_utils/responsive_ui_setup/enums/device_screen_type.dart';
import 'package:flutter/material.dart';

class SizingInformation {
  SizingInformation({
    required this.orientation,
    required this.deviceType,
    required this.screenSize,
    required this.localWidgetSize,
  });

  final Orientation orientation;
  final DeviceScreenType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  @override
  String toString() {
    return 'Orientation:$orientation DeviceType:$deviceType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
