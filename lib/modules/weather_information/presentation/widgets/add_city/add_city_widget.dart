import 'package:flaconi_case_study/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/values/styles.dart';
import 'package:flutter/material.dart';

class AddCityWidget extends StatelessWidget {
  AddCityWidget({
    Key? key,
    required this.onTapFunction,
  }) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final Function(String) onTapFunction;

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
                    'Add City',
                    style: boldTextStyle.copyWith(
                      fontSize: config.getResponsiveItemSize(20),
                    ),
                  ),
                  SizedBox(
                    height: config.getResponsiveItemSize(20),
                  ),
                  TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(
                        config.getResponsiveItemSize(8),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            config.getResponsiveItemSize(10)),
                      ),
                      hintText: 'Enter a place name',
                      prefixIcon: Icon(
                        Icons.search,
                        size: config.getResponsiveItemSize(25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.getResponsiveItemSize(20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      onTapFunction(controller.text);
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                        config.getResponsiveItemSize(10),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      child: Icon(
                        Icons.check,
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
