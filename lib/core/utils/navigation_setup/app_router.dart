import 'package:auto_route/auto_route.dart';
import 'package:flaconi_case_study/core/utils/navigation_setup/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: SplashScreenRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: WeatherInformationRoute.page,
        ),
        AutoRoute(
          page: WeatherInformationDetailsPortraitRoute.page,
        ),
      ];
}
