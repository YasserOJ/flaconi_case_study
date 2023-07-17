import 'package:auto_route/auto_route.dart';
import 'package:flaconi_case_study/core/utils/app_shared_preferences/app_shared_prefs.dart';
import 'package:flaconi_case_study/core/utils/dependency_injection/component/app_component.dart';
import 'package:flaconi_case_study/core/utils/navigation_setup/app_router.gr.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/values/app_colors.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/config_setup/config.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:flaconi_case_study/splash_screen/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final SplashScreenViewModel _splashScreenViewModel;
  late StackRouter _appRouter;

  @override
  void initState() {
    super.initState();

    locator<AppSharedPrefs>().saveUserCities(['paris']);

    _splashScreenViewModel = SplashScreenViewModel();
    _splashScreenViewModel.getUserInfoAndSaveInUserManager();

    _controller = AnimationController(vsync: this);
    if (mounted) {
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _appRouter.replace(const WeatherInformationRoute());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConfigManager(
      initializeConfig: true,
      builder: (BuildContext context, Config config, StackRouter appRouter) {
        _appRouter = appRouter;
        return Container(
          color: blue87CEEB,
          width: config.screenWidth,
          height: config.screenHeight,
          child: Center(
            child: Lottie.asset(
              'assets/splash_animation.zip',
              controller: _controller,
              onLoaded: (LottieComposition composition) {
                _controller
                  ..duration = composition.duration
                  ..forward();
              },
            ),
          ),
        );
      },
    );
  }
}
