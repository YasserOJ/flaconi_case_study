import 'package:flaconi_case_study/core/enums/weather_metrics_enum.dart';
import 'package:flaconi_case_study/core/managers/user_manager.dart';
import 'package:flaconi_case_study/core/utils/app_shared_preferences/app_shared_prefs.dart';
import 'package:flaconi_case_study/core/utils/dependency_injection/component/app_component.dart';

class SplashScreenViewModel {
  void getUserInfoAndSaveInUserManager() {
    _getSavedCitiesNamesAndSaveToUserManager();
    _getSavedUserMetricsSaveToUserManager();
  }

  void _getSavedCitiesNamesAndSaveToUserManager() {
    final cities = locator<AppSharedPrefs>().getSavedCities();
    locator<UserManager>().userCitiesNames = cities;
  }

  void _getSavedUserMetricsSaveToUserManager() {
    final metrics = locator<AppSharedPrefs>().getSavedMetric();
    locator<UserManager>().userMetric = metrics.toWeatherMetricsEnum();
  }
}
