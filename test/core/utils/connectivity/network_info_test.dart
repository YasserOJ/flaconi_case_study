import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flaconi_case_study/core/utils/connectivity/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks(<Type>[Connectivity])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfo = NetworkInfoImpl(mockConnectivity);
  });

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
          () async {
        // arrange
        final Future<ConnectivityResult> tHasConnectionFuture =
        Future<ConnectivityResult>.value(ConnectivityResult.mobile);

        when(mockConnectivity.checkConnectivity()).thenAnswer((_) => tHasConnectionFuture);
        // act
        final bool result = await networkInfo.isConnected;
        // assert
        verify(mockConnectivity.checkConnectivity());
        expect(result, true);
      },
    );
  });
}