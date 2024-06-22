import 'package:get_storage/get_storage.dart';

class LocalStorage{
  late final GetStorage _storage;

  static LocalStorage? _instance;

  LocalStorage._internal();
  

  factory LocalStorage.instance() {
    _instance ??= LocalStorage._internal();
    return _instance!;
  }
  
  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = LocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  Future<void> writeData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  T? readData<T>(String key) {
    return _storage.read<T>(key);
  } 

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }
}