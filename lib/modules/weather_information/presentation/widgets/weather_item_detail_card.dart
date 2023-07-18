import 'package:flaconi_case_study/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/values/styles.dart';
import 'package:flutter/material.dart';

class WeatherItemDetailCard extends StatelessWidget {
  const WeatherItemDetailCard({
    super.key,
    required this.title,
    required this.description,
    required this.iconData,
  });

  final String title;
  final String description;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ConfigManager(
      builder: (context, config, _) {
        return Container(
          padding: EdgeInsets.all(
            config.getResponsiveItemSize(20),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              config.getResponsiveItemSize(20),
            ),
            color: Theme.of(context).colorScheme.primary.withOpacity(.3),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(iconData),
                  Text(
                    title,
                    style: boldTextStyle,
                  ),
                ],
              ),
              Text(
                description,
                style: normalTextStyle,
              ),
            ],
          ),
        );
      },
    );
  }
}
