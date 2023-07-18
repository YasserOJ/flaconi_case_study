import 'package:auto_route/auto_route.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/values/styles.dart';
import 'package:flaconi_case_study/generated/l10n.dart';
import 'package:flutter/material.dart';

class LoadingWeatherInformationErrorPopup extends StatelessWidget {
  const LoadingWeatherInformationErrorPopup({
    Key? key,
    required this.onTapFunction,
  }) : super(key: key);

  final Function onTapFunction;

  @override
  Widget build(BuildContext context) {
    return ConfigManager(
      builder: (BuildContext context, config, _) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: config.getResponsiveItemSize(20),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: config.getResponsiveItemSize(30),
                vertical: config.getResponsiveItemSize(20),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    config.getResponsiveItemSize(20),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    Localized.of(context).error_text,
                    style: boldTextStyle.copyWith(
                      fontSize: config.getResponsiveItemSize(20),
                    ),
                  ),
                  SizedBox(
                    height: config.getResponsiveItemSize(20),
                  ),
                  Text(
                    Localized.of(context).general_error_text,
                    style: normalTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: config.getResponsiveItemSize(20),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.router.pop();
                      onTapFunction();
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                        config.getResponsiveItemSize(10),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: config.getResponsiveItemSize(50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
