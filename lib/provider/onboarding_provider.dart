import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wonderful_indonesia/constant.dart';

class OnboardingProvider with ChangeNotifier {
  final String _onboardKey = StorageKeys.onboardKey;
  final GetStorage _box = GetStorage();

  bool get isOnboarded {
    return _box.read(_onboardKey) != null;
  }

  void haveOnboarding() {
    _box.write(_onboardKey, true);
    notifyListeners();
  }
}
