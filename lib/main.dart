import 'package:blog_club/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
                fontFamily: defaultFontFamily,
                fontWeight: FontWeight.bold,
                color: primaryTextColor),
            titleMedium: TextStyle(
                fontFamily: defaultFontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: primaryTextColor),
            titleSmall: TextStyle(
                fontFamily: defaultFontFamily,
                color: secondaryTextColor,
                fontWeight: FontWeight.w200,
                fontSize: 18),
            bodySmall: TextStyle(
                fontFamily: defaultFontFamily,
                color: secondaryTextColor,
                fontSize: 12)),
      ),
      home: const MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hi, Johnatan',
                    style: TextStyle(),
                  ),
                  Image.asset(
                    'assets/img/icons/notification.png',
                    width: 24,
                    height: 24,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 32, bottom: 16),
              child: Text(
                'Explore Todays',
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stories.length,
                  padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                  itemBuilder: (context, index) {
                    final story = stories[index];
                    return Container(
                        width: 68,
                        height: 68,
                        margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 68,
                                  height: 68,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          colors: [
                                            Color(0xff376aed),
                                            Color(0xff498ef2),
                                            Color(0xff9cecf8),
                                          ])),
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: EdgeInsets.all(4),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.asset(
                                            'assets/img/stories/${story.imageFileName}')),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                    child: Image.asset(
                                  'assets/img/icons/${story.iconFileName}',
                                  width: 24,
                                  height: 24,
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(story.name)
                          ],
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
