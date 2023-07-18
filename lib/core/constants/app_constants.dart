const String baseUrl = String.fromEnvironment('base_url',
    defaultValue: 'http://api.weatherstack.com/');
const String accessKeyValue =
    String.fromEnvironment(accessKey);
const Duration timeOutDuration = Duration(seconds: 20);

//app keys
const String accessKey = 'access_key';
const String userCitiesKey = 'user_cities';
const String userMetricsKey = 'user_metrics';
const String hadSavedCurrentLocation = 'user_had_saved_current_location';
const String celsiusKey = 'celsius';
const String fahrenheitKey = 'fahrenheit';

// app uris
const String currentWeatherUri = 'current';
