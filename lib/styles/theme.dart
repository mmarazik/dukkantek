import 'package:flutter/material.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

// final Color primaryColor = HexColor.fromHex(0xFF593485);
const Color primaryColor = Color(0xFF593485);
const Color secondaryColor = Color(0xFF57AF99);
const Color onPrimary = Color(0xFFFAF4E8);
const Color onSecondary = Color(0xFF593485);
const Color secondaryContainer = Color(0xFFD5EADF);

final Map<int, Color> dokkanTekColorMap = {
  50: Color.fromRGBO(
      primaryColor.red, primaryColor.green, primaryColor.blue, .1),
  100: Color.fromRGBO(
      primaryColor.red, primaryColor.green, primaryColor.blue, .2),
  200: Color.fromRGBO(
      primaryColor.red, primaryColor.green, primaryColor.blue, .3),
  300: Color.fromRGBO(
      primaryColor.red, primaryColor.green, primaryColor.blue, .4),
  400: Color.fromRGBO(
      primaryColor.red, primaryColor.green, primaryColor.blue, .5),
  500: Color.fromRGBO(
      primaryColor.red, primaryColor.green, primaryColor.blue, .6),
  600: Color.fromRGBO(
      primaryColor.red, primaryColor.green, primaryColor.blue, .7),
  700: Color.fromRGBO(
      primaryColor.red, primaryColor.green, primaryColor.blue, .8),
  800: Color.fromRGBO(
      primaryColor.red, primaryColor.green, primaryColor.blue, .9),
  900: Color.fromRGBO(
      primaryColor.red, primaryColor.green, primaryColor.blue, 1),
};

class DokkanTekTheme {
  static ThemeData getThemeData(BuildContext context) {
    return ThemeData(
      primarySwatch: MaterialColor(primaryColor.value, dokkanTekColorMap),
      colorScheme: ColorScheme.fromSwatch(
              primarySwatch:
                  MaterialColor(primaryColor.value, dokkanTekColorMap))
          .copyWith(
              secondary: secondaryColor,
              onSecondary: onSecondary,
              // onPrimary: onPrimary,
              secondaryContainer: secondaryContainer),
    );
  }
}
