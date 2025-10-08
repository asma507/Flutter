import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Color _primaryColor = const Color(0xFF6750A4);
  List<Color> _backgroundGradient = [
    const Color(0xFF1E1E1E),
    const Color(0xFF2D1B69),
  ];

  ThemeMode get themeMode => _themeMode;
  Color get primaryColor => _primaryColor;
  List<Color> get backgroundGradient => _backgroundGradient;

  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      // ignore: deprecated_member_use
      return WidgetsBinding.instance.window.platformBrightness ==
          Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', themeMode.index);
  }

  Future<void> setPrimaryColor(Color color) async {
    _primaryColor = color;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('primary_color', color.value);
  }

  void setBackgroundGradient(List<Color> colors) {
    _backgroundGradient = colors;
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final themeIndex = prefs.getInt('theme_mode') ?? ThemeMode.system.index;
    _themeMode = ThemeMode.values[themeIndex];

    final colorValue =
        prefs.getInt('primary_color') ?? const Color(0xFF6750A4).value;
    _primaryColor = Color(colorValue);

    notifyListeners();
  }

  // Generate gradient colors from album artwork
  void generateGradientFromImage(List<Color> dominantColors) {
    if (dominantColors.isNotEmpty) {
      final baseColor = dominantColors.first;
      _backgroundGradient = [
        baseColor.withOpacity(0.1),
        baseColor.withOpacity(0.3),
        if (dominantColors.length > 1) dominantColors[1].withOpacity(0.2),
      ];
      notifyListeners();
    }
  }
}
