// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Localized {
  Localized();

  static Localized? _current;

  static Localized get current {
    assert(_current != null,
        'No instance of Localized was loaded. Try to initialize the Localized delegate before accessing Localized.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Localized> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Localized();
      Localized._current = instance;

      return instance;
    });
  }

  static Localized of(BuildContext context) {
    final instance = Localized.maybeOf(context);
    assert(instance != null,
        'No instance of Localized present in the widget tree. Did you add Localized.delegate in localizationsDelegates?');
    return instance!;
  }

  static Localized? maybeOf(BuildContext context) {
    return Localizations.of<Localized>(context, Localized);
  }

  /// `Cities`
  String get cities_app_bar_title {
    return Intl.message(
      'Cities',
      name: 'cities_app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `°C`
  String get celsius_abbrivation_text {
    return Intl.message(
      '°C',
      name: 'celsius_abbrivation_text',
      desc: '',
      args: [],
    );
  }

  /// `°F`
  String get fahrenheit_abbrivation_text {
    return Intl.message(
      '°F',
      name: 'fahrenheit_abbrivation_text',
      desc: '',
      args: [],
    );
  }

  /// `Min/Max:`
  String get min_max_text {
    return Intl.message(
      'Min/Max:',
      name: 'min_max_text',
      desc: '',
      args: [],
    );
  }

  /// `Feel like`
  String get feels_like_text {
    return Intl.message(
      'Feel like',
      name: 'feels_like_text',
      desc: '',
      args: [],
    );
  }

  /// `Humidity:`
  String get humidity_text {
    return Intl.message(
      'Humidity:',
      name: 'humidity_text',
      desc: '',
      args: [],
    );
  }

  /// `Pressure:`
  String get pressure_text {
    return Intl.message(
      'Pressure:',
      name: 'pressure_text',
      desc: '',
      args: [],
    );
  }

  /// `hPa`
  String get pressure_metric_text {
    return Intl.message(
      'hPa',
      name: 'pressure_metric_text',
      desc: '',
      args: [],
    );
  }

  /// `KM/h`
  String get wind_speed_metric_text {
    return Intl.message(
      'KM/h',
      name: 'wind_speed_metric_text',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get good_morning_text {
    return Intl.message(
      'Good Morning',
      name: 'good_morning_text',
      desc: '',
      args: [],
    );
  }

  /// `Good Afternoon`
  String get good_afternoon_text {
    return Intl.message(
      'Good Afternoon',
      name: 'good_afternoon_text',
      desc: '',
      args: [],
    );
  }

  /// `Good Night`
  String get good_night_text {
    return Intl.message(
      'Good Night',
      name: 'good_night_text',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Localized> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Localized> load(Locale locale) => Localized.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
