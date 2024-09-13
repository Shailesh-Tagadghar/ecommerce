import 'package:get_storage/get_storage.dart';

class StorageUtil {
  static final GetStorage _storage = GetStorage();

  static void save(String key, dynamic value) {
    _storage.write(key, value);
  }

  static dynamic read(String key) {
    return _storage.read(key);
  }
}
