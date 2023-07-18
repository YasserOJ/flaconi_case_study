import 'package:flaconi_case_study/core/enums/weather_metrics_enum.dart';
import 'package:flaconi_case_study/core/managers/user_manager.dart';
import 'package:flaconi_case_study/core/utils/dependency_injection/component/app_component.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/config_setup/config.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:flaconi_case_study/generated/l10n.dart';
import 'package:flutter/material.dart';

class WeatherInformationViewAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final AppBar appBar;
  final Function(bool) switchValueChanged;

  const WeatherInformationViewAppBar({
    Key? key,
    required this.appBar,
    required this.switchValueChanged,
  }) : super(key: key);

  @override
  State<WeatherInformationViewAppBar> createState() =>
      _WeatherInformationViewAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

class _WeatherInformationViewAppBarState
    extends State<WeatherInformationViewAppBar> {
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    switchValue =
        locator<UserManager>().userMetric == WeatherMetricsEnum.celsius
            ? false
            : true;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(
        Localized.of(context).cities_app_bar_title,
      ),
      actions: [
        ConfigManager(
          builder: (BuildContext context, Config config, _) {
            return Padding(
              padding: EdgeInsets.only(
                right: config.getResponsiveItemSize(20),
              ),
              child: Row(
                children: [
                  Text(
                    Localized.of(context).celsius_abbrivation_text,
                  ),
                  Switch(
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                      widget.switchValueChanged(value);
                    },
                    inactiveTrackColor: Theme.of(context).primaryColor,
                  ),
                  Text(
                    Localized.of(context).fahrenheit_abbrivation_text,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
