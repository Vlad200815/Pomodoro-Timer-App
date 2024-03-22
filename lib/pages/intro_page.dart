import 'package:flutter/material.dart';
import 'package:hello/components/special_buttons.dart';
// import 'package:hello/pages/clock_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    void hello() {
      Navigator.of(context).pushNamed("/clock_page");
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.access_alarm_outlined,
                size: 100,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Pomodoro Timer",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 50, 49, 49),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Created by Vlad",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 117, 117, 117),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: Colors.deepPurple,
                    height: 120,
                    width: 120,
                    child: ButtonWidget(
                      onPressed: hello,
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 33,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
