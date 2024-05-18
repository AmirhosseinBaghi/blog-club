import 'package:blog_club/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then(
        (value) => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => MyHomeScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
          child: Image.asset(
        "assets/img/background/splash.png",
        fit: BoxFit.fill,
      )),
      Center(
        child: SvgPicture.asset(
          'assets/img/icons/LOGO.svg',
          width: MediaQuery.of(context).size.width * 0.3,
        ),
      )
    ]);
  }
}
