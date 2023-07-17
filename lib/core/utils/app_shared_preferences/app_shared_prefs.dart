import 'package:flaconi_case_study/core/constants/app_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AppSharedPrefs {
  final SharedPreferences? sharedPreferences;

  AppSharedPrefs(this.sharedPreferences);

  List<String> getSavedCities() {
    final List<String> cities =
        sharedPreferences?.getStringList(userCitiesKey) ?? [];
    return cities;
  }

  Future<void> saveUserCities(List<String> cities) async {
    await sharedPreferences?.setStringList(userCitiesKey, cities);
  }

  String getSavedMetric() {
    String? metrics = sharedPreferences?.getString(userMetricsKey);
    if (metrics == null) {
      metrics = celsiusKey;
      saveUserMetrics(metrics);
    }
    return metrics;
  }

  Future<void> saveUserMetrics(String userMetric) async {
    await sharedPreferences?.setString(userMetricsKey, userMetric);
  }
}
