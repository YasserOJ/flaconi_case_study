import 'package:flaconi_case_study/core/service/base_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class BaseServiceMock extends Mock implements BaseService {}

@GenerateMocks(<Type>[BaseServiceMock])
class Mocks {}
