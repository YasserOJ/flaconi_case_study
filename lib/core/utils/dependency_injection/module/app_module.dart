import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  @injectable
  Connectivity get connectivity => Connectivity();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
