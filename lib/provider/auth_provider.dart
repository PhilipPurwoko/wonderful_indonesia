import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wonderful_indonesia/models/user_model.dart';

class AuthProvider with ChangeNotifier {
  final String _userKey = 'user';
  final GetStorage _box = GetStorage();

  bool get isAuthenticated {
    return _box.read(_userKey) != null;
  }

  UserModel get user {
    return UserModel.fromJson(_box.read(_userKey));
  }

  void authenticate(UserModel user) {
    _box.write(_userKey, user.toJson());
    notifyListeners();
  }

  void logout() {
    _box.remove(_userKey);
    notifyListeners();
  }
}
