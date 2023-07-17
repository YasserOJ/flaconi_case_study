import 'dart:math' as math;

extension StringExtension on String {
  double getArrowRotationAngle() {
    const double defaultAddValue = 22.5;
    double degrees = 0;
    switch (this) {
      case 'NNE':
        degrees = defaultAddValue;
      case 'NE':
        degrees = defaultAddValue * 2;
      case 'ENE':
        degrees = defaultAddValue * 3;
      case 'E':
        degrees = defaultAddValue * 4;
      case 'ESE':
        degrees = defaultAddValue * 5;
      case 'SE':
        degrees = defaultAddValue * 6;
      case 'SSE':
        degrees = defaultAddValue * 7;
      case 'S':
        degrees = defaultAddValue * 8;
      case 'SSW':
        degrees = defaultAddValue * 9;
      case 'SW':
        degrees = defaultAddValue * 10;
      case 'WSW':
        degrees = defaultAddValue * 11;
      case 'W':
        degrees = defaultAddValue * 12;
      case 'WNW':
        degrees = defaultAddValue * 13;
      case 'NW':
        degrees = defaultAddValue * 14;
      case 'NNW':
        degrees = defaultAddValue * 15;
      default:
        degrees = 0;
    }
    return degrees * (math.pi / 180);
  }
}
