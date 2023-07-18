import 'package:flaconi_case_study/core/utils/extensions/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late String testString;
  late String testString2;

  setUp(() {
    testString = 'N';
    testString2 = 'NNE';
  });

  group('getArrowDirection function', () {
    test(
        'GIVEN user got weather info and wind information '
        'WHEN _getArrowDirection() method is called '
        'THEN it return ArrowRotation angle', () {
      final rotationDegree = testString.getArrowRotationAngle();
      expect(rotationDegree, 0);
      final rotationDegree2 = testString2.getArrowRotationAngle();
      expect(rotationDegree2, 0.39269908169872414);
    });
  });
}
