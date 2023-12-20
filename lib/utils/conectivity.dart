import 'package:connectivity/connectivity.dart';

import 'sync_manager.dart';

class ConnectivityManager {
  static Future<void> start() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      await SyncManager.synchronize();
    }

    Connectivity().onConnectivityChanged.listen((connectivityResult) async {
      if (connectivityResult != ConnectivityResult.none) {
        await SyncManager.synchronize();
      }
    });
  }
}