import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityManager {
  static ConnectivityManager? _connectivityManager;
  static Connectivity? _connectivity;
  ConnectivityManager._createInstance();
  factory ConnectivityManager() {
    if (_connectivityManager == null) {
      _connectivityManager = ConnectivityManager
          ._createInstance(); 
      _connectivity = _getConnectivity();
    }
    return _connectivityManager!;
  }
  static Connectivity _getConnectivity() {
    return _connectivity ??= Connectivity();
  }

  Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return false;
    }
  }
}