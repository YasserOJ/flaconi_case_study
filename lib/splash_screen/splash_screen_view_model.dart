import 'package:flaconi_case_study/core/enums/weather_metrics_enum.dart';
import 'package:flaconi_case_study/core/managers/user_manager.dart';
import 'package:flaconi_case_study/core/utils/app_shared_preferences/app_shared_prefs.dart';
import 'package:flaconi_case_study/core/utils/dependency_injection/component/app_component.dart';
import 'package:location/location.dart';

class SplashScreenViewModel {
  bool shouldContinueToHomeScreen = false;

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

  Future<void> checkUserCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        shouldContinueToHomeScreen = true;
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        shouldContinueToHomeScreen = true;
        return;
      }
    }

    locationData = await location.getLocation();

    final AppSharedPrefs tempAppSharedPrefs = locator<AppSharedPrefs>();

    List<String> cities = tempAppSharedPrefs.getSavedCities();

    final bool hadUserSavedLocationBefore =
        tempAppSharedPrefs.getHadUserSavedLocationBefore();
    if (hadUserSavedLocationBefore) {
      cities.first = '${locationData.latitude},${locationData.longitude}';
      await tempAppSharedPrefs.saveUserCities(cities);
      _getSavedCitiesNamesAndSaveToUserManager();
      shouldContinueToHomeScreen = true;
    } else {
      await tempAppSharedPrefs.saveUserHadSavedLocationBefore();
      cities.insert(0, '${locationData.latitude},${locationData.longitude}');
      await tempAppSharedPrefs.saveUserCities(cities);
      _getSavedCitiesNamesAndSaveToUserManager();
      shouldContinueToHomeScreen = true;
    }
  }
}
