import 'package:flaconi_case_study/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final bool shouldShowLoadingIndicator;
  final Widget child;

  const LoadingIndicatorWidget({
    Key? key,
    required this.shouldShowLoadingIndicator,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConfigManager(
      builder: (context, config, _) {
        return Stack(
          fit: StackFit.expand,
          children: [
            child,
            if (shouldShowLoadingIndicator)
              Container(
                color: Colors.black.withOpacity(.5),
                child: Center(
                  child: Container(
                    width: config.screenWidth * .3,
                    height: config.screenWidth * .3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        config.getResponsiveItemSize(15),
                      ),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
