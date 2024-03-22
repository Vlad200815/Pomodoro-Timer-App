import 'package:flutter/material.dart';
import 'package:hello/pages/clock_page.dart';
import 'package:hello/pages/intro_page.dart';
import 'package:hello/pages/question_page.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();

  await Hive.openBox("pomodoroes");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(primaryColor: Colors.grey[350]),
        home: const IntroPage(),
        routes: {
          '/clock_page': (context) => const ClockPage(),
          '/intro_page': (context) => const IntroPage(),
          '/question_page': (context) => const QuestionPage(),
          // '/calendar_page': (context) => const MyHeatMap(),
        });
  }
}
