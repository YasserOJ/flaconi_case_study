import 'package:flaconi_case_study/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/values/styles.dart';
import 'package:flaconi_case_study/generated/l10n.dart';
import 'package:flaconi_case_study/modules/weather_information/domain/entity/weather_information_entity.dart';
import 'package:flutter/material.dart';

class WeatherInfoItem extends StatelessWidget {
  final WeatherInformationEntity itemWeatherInformation;
  final bool isSelected;
  final bool isItemSelectable;
  final Function didTapOnItem;

  const WeatherInfoItem({
    Key? key,
    required this.itemWeatherInformation,
    required this.isSelected,
    this.isItemSelectable = false,
    required this.didTapOnItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConfigManager(
      builder: (context, config, _) {
        return GestureDetector(
          onTap: () {
            didTapOnItem();
          },
          child: Container(
            color: isSelected && isItemSelectable
                ? Theme.of(context).colorScheme.inversePrimary.withOpacity(.5)
                : Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: config.getResponsiveItemSize(18),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemWeatherInformation.weekDayAbbreviationName,
                          style: boldTextStyle.copyWith(
                            fontSize: config.getResponsiveItemSize(23),
                          ),
                        ),
                        Text(
                          itemWeatherInformation.cityName,
                          style: boldTextStyle.copyWith(
                            fontSize: config.getResponsiveItemSize(18),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: Localized.of(context).min_max_text,
                            style: boldTextStyle.copyWith(
                              fontSize: config.getResponsiveItemSize(14),
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    ' ${(itemWeatherInformation.temperature) - 5}°/${(itemWeatherInformation.temperature) + 5}°',
                                style: normalTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: config.getResponsiveItemSize(100),
                  child: FadeInImage(
                    placeholder: const AssetImage(
                      'assets/weather_loading.gif',
                    ),
                    image: NetworkImage(
                      itemWeatherInformation.weatherIcon,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
