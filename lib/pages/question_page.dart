import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text("Documentation"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "To start this bieutiful timer,\n just press on a start button,\n then you will have your time to work and consentrate.\nPause button makes timer pause,\n restart button restarts the timer.\nThe button give up, if you really wanna stop everything \njust press it you will see your results.",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                "lib/images/hitler.webp",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
