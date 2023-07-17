import 'package:flaconi_case_study/core/utils/ui_utils/responsive_ui_setup/enums/device_screen_type.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/responsive_ui_setup/responsive_builder.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/responsive_ui_setup/sizing_information.dart';
import 'package:flutter/material.dart';

class ScreenTypeLayout extends StatelessWidget {
  const ScreenTypeLayout({
    Key? key,
    required this.mobile,
    this.tablet,
  }) : super(key: key); //Widget web;

  final Widget mobile;
  final Widget? tablet;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        if (sizingInformation.deviceType == DeviceScreenType.tablet) {
          if (tablet != null) {
            return tablet!;
          }
        }
        return mobile;
      },
    );
  }
}
