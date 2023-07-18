// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "celsius_abbrivation_text": MessageLookupByLibrary.simpleMessage("°C"),
        "cities_app_bar_title": MessageLookupByLibrary.simpleMessage("Cities"),
        "error_text": MessageLookupByLibrary.simpleMessage("Error"),
        "fahrenheit_abbrivation_text":
            MessageLookupByLibrary.simpleMessage("°F"),
        "feels_like_text": MessageLookupByLibrary.simpleMessage("Feel like"),
        "general_error_text": MessageLookupByLibrary.simpleMessage(
            "An error has occured when loading cities weather information.\nPlease retry again."),
        "good_afternoon_text":
            MessageLookupByLibrary.simpleMessage("Good Afternoon"),
        "good_morning_text":
            MessageLookupByLibrary.simpleMessage("Good Morning"),
        "good_night_text": MessageLookupByLibrary.simpleMessage("Good Night"),
        "humidity_text": MessageLookupByLibrary.simpleMessage("Humidity:"),
        "min_max_text": MessageLookupByLibrary.simpleMessage("Min/Max:"),
        "pressure_metric_text": MessageLookupByLibrary.simpleMessage("hPa"),
        "pressure_text": MessageLookupByLibrary.simpleMessage("Pressure:"),
        "reached_limit_error_text": MessageLookupByLibrary.simpleMessage(
            "You have Reached the limit of cities that you can fetch.\nPlease subscribe to our premium plan to get unlimited cities and more."),
        "subscribe_text": MessageLookupByLibrary.simpleMessage("Subscribe"),
        "wind_speed_metric_text": MessageLookupByLibrary.simpleMessage("KM/h")
      };
}
