import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:makemyhome/utils/popups/loader.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubcription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubcription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus as void Function(List<ConnectivityResult> event)?);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
      final result = results.first; 
      _connectionStatus.value = result;
      if (_connectionStatus.value == ConnectivityResult.none) {
        TLoader.warningSnackBar(title: 'No Internet Connection');
      }
    }

    Future<bool> isConnected() async {
      try {
        final result = await _connectivity.checkConnectivity();
        if (result == ConnectivityResult.none) {
          return false;
        } else {
          return true;
        }
      } on PlatformException catch (_) {
        return false;
      }
    }

    @override
    void onClose() {
      super.onClose();
      _connectivitySubcription.cancel();
    }
}