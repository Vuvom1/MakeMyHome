import 'package:get/get.dart';
import 'package:makemyhome/utils/network/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}