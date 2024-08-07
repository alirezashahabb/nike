import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nike/screen/home/home_screen.dart';
import 'package:nike/theme.dart';

const defaultTextStyle =
    TextStyle(fontFamily: 'Vazir', color: LightThemeColors.primaryTextColor);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const defaultTextStyle = TextStyle(
        fontFamily: 'Vazir', color: LightThemeColors.primaryTextColor);
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // English
      ],
      title: 'Nike',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
            bodyMedium: defaultTextStyle,
            displaySmall: defaultTextStyle.apply(
                color: LightThemeColors.secondaryTextColor),
            titleLarge: defaultTextStyle.copyWith(fontWeight: FontWeight.bold)),
        colorScheme: const ColorScheme.light(
          primary: LightThemeColors.primaryColor,
          secondary: LightThemeColors.secondaryColor,
          onSecondary: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
