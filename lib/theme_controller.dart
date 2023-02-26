import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final box = GetStorage();
  final key = 'theme';

  ThemeMode getTheme() {
    return isDark() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isDark() {
    return box.read(key) ?? false;
  }

  void saveTheme(bool isDarkMode) {
    box.write(key, isDarkMode);
  }

  void changeTheme() {
    Get.changeThemeMode(isDark() ? ThemeMode.light : ThemeMode.dark);
    saveTheme(!isDark());
  }
}
