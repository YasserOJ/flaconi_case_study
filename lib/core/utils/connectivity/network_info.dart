import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@Injectable(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this.connectivity);

  final Connectivity connectivity;

  @override
  Future<bool> get isConnected => _checkConnectivity();

  Future<bool> _checkConnectivity() async {
    final ConnectivityResult connectivityResult = await connectivity.checkConnectivity();
    return _handleResult(connectivityResult);
  }

  bool _handleResult(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
