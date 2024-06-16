
import 'package:blog_club/profile.dart';


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamily = 'Avenir';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
           theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
        )))),
        colorScheme: const ColorScheme.light(
            primary: primaryColor,
            onPrimary: Colors.white,
            onSurface: primaryTextColor,
            background: Color(0xffFBFCFF),
            surface: Colors.white,
            onBackground: primaryTextColor),
        appBarTheme: const AppBarTheme(
          titleSpacing: 32,
          backgroundColor: Color(0xffFBFCFF),
          foregroundColor: primaryTextColor,
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryColor,
        ),
        textTheme:  const TextTheme(
            titleMedium: TextStyle(
                fontFamily: defaultFontFamily,
                color: secondaryTextColor,
                fontWeight: FontWeight.w200,
                fontSize: 18),
            titleLarge: TextStyle(
                fontFamily: defaultFontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: primaryTextColor),
            headlineMedium: TextStyle(
                fontFamily: defaultFontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: primaryTextColor),
            headlineSmall: TextStyle(
                fontFamily: defaultFontFamily,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: primaryTextColor),
            bodySmall: TextStyle(
                fontFamily: defaultFontFamily,
                fontWeight: FontWeight.w700,
                color: Color(0xff7B8BB2),
                fontSize: 10),
            titleSmall: TextStyle(
                fontFamily: defaultFontFamily,
                color: primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 14),
            bodyLarge: TextStyle(
                fontFamily: defaultFontFamily,
                color: primaryTextColor,
                fontSize: 14),
            bodyMedium: TextStyle(
                fontFamily: defaultFontFamily,
                color: secondaryTextColor,
                fontSize: 12)),
      ),
      // home: const MyHomeScreen(),
      home: const ProfileScreen(),
    );
  }
}


class Bottomnav extends StatelessWidget {
  const Bottomnav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: const Color.fromARGB(255, 26, 123, 214),
      items: const[
       BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: "home"
      ),
      BottomNavigationBarItem(icon: Icon(Icons.settings),label: "setting",)
    ]);
  }
}
