import 'dart:async';
// import "package:hello/components/heatmap_calendar.dart";
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hello/components/button.dart';
// import 'package:hello/data/pomo_datebase.dart';
// import 'package:hello/data/pomo_day_time_database.dart';
import 'package:hive/hive.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wakelock/wakelock.dart';
import "package:hello/components/ges.dart";

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  int minuts = 25;
  int firstMin = 25;
  int seconds = 0;
  String minText = '25';
  String secText = '00';
  int pomodoroes = 0;

  String pomoKey = 'home_counter';

  @override
  void initState() {
    super.initState();
    final box = Hive.box('pomodoroes');
    final value = box.get(pomoKey) ?? 0;
    pomodoroes = value;
  }

  void incrementPomo() {
    final box = Hive.box("pomodoroes");
    setState(() {
      pomodoroes = pomodoroes + 1;
    });
    box.put(pomoKey, pomodoroes);
  }

////////////////////////////////////////////////////////////////////////
  // Map<DataTime, int> heatMapDataSet = {};
  // void startDate() {
  //   final box = Hive.box("pomodoroes");
  //   box.put(1, todaysDateFormatted());
  // }

  // void loadData() {
  //   final box = Hive.box("pomodoroes");
  //   if (box.get(todaysDateFormatted()) == null) {
  //     box.clear();
  //   } else {}
  // }
///////////////////////////////////////////////////////////////////////////

  var business = "W O R K";

  Timer? timer;

  final player = AudioPlayer();

  void _showdialog() {
    int overallTime = pomodoroes * 25;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.deepPurple[50],
            title: const Text("Are you sure?"),
            content: const Text(
              "if you give up, you're a fool!",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  start();
                  // timer!.cancel();
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              MyButtonWaite(
                onPressed: () {
                  setState(() {
                    // minuts = 25;
                    // seconds = 0;
                    // secText = "00";
                    // minText = "25";
                    // business = ("W O R K");
                    // pomodoroes = 0;
                    Navigator.pop(context);
                    player.play(AssetSource('hell.mp3'));
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.deepPurple[50],
                            title: const Text("Geat Job Bro"),
                            content: Text(
                              "Overall time: $overallTime\npomodoroes: $pomodoroes",
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                            actions: [
                              MyButtonWaite(
                                onPressed: () {
                                  setState(() {
                                    minuts = 25;
                                    seconds = 0;
                                    secText = "00";
                                    minText = "25";
                                    business = ("W O R K");
                                    // pomodoroes = 0;
                                    player.play(AssetSource('hell.mp3'));
                                    Navigator.pop(context);
                                  });

                                  timer!.cancel();
                                },
                                label: 'Ok',
                                timeOutInSeconds: 2,
                              )
                            ],
                          );
                        });
                  });

                  timer!.cancel();
                },
                label: 'Ok',
                timeOutInSeconds: 19,
              )
            ],
          );
        });
  }

  void pause() {
    timer!.cancel();
  }

  void onDouble() {
    timer?.cancel();
  }

  void giveUp() {
    player.play(
      AssetSource("just_do_it.mp3"),
    );
    timer?.cancel();
  }

  void restart() {
    setState(() {
      if (business == "W O R K") {
        seconds = 0;
        minuts = 25;
        minText = '25';
        secText = '00';
      } else if (business == "R E S T") {
        seconds = 0;
        minuts = 5;
        secText = "00";
        minText = "5";
      }
    });
  }

  void start() {
    player.play(AssetSource("kaney.mp3"));
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
          secText = "$seconds";

          if (seconds < 10) {
            secText = "0$seconds";
          }
        });
      } else if (minuts <= 0 && seconds <= 0 && business == "W O R K") {
        setState(() {
          player.play(AssetSource("shit.mp3"));
          timer.cancel();
          business = "R E S T";
          minuts = 5;
          firstMin = 5;
          seconds = 0;
          minText = "5";
          secText = "00";
          // pomodoroes++;
          incrementPomo();
        });
      } else if (minuts <= 0 && seconds <= 0 && business == "R E S T" ||
          business == "") {
        //
        setState(() {
          player.play(AssetSource("gas.mp3"));
          timer.cancel();
          business = "W O R K";
          minuts = 25;
          firstMin = 25;
          seconds = 0;
          minText = "25";
          secText = "00";
        });
      } else if (seconds == 0) {
        minuts--;
        seconds = 60;
        minText = "$minuts";
        if (minuts < 10) {
          minText = "0$minuts";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.question_mark_outlined,
              color: Colors.grey[800],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/question_page');
            },
          ),
        ],
        title: const Padding(
          padding: EdgeInsets.only(left: 57.0),
          child: Text("Pomodoro Timer"),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple[100],
          child: ListView(
            children: [
              const DrawerHeader(
                child: Icon(
                  Icons.access_alarm_outlined,
                  size: 90,
                ),
              ),
              const ListTile(),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/intro_page');
                },
                title: const Text("Exit", style: TextStyle(fontSize: 20)),
                leading: const Icon(
                  Icons.exit_to_app_sharp,
                  color: Colors.black,
                  size: 40,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/question_page');
                },
                title:
                    const Text("Documentation", style: TextStyle(fontSize: 20)),
                leading: const Icon(
                  Icons.question_mark_outlined,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.only(right: 14.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.calendar_month_sharp,
                        color: Colors.deepPurple),
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.deepPurple[50],
                        context: context,
                        builder: (BuildContext context) => ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //////////////////////////////////////////////
                                ///HeatMap by itself
                                // MyHeatMap(
                                //   datasets: datasets,
                                //   startDate: box.get(1),
                                // ),
                                ///////////////////////////////////
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Text(
                    business,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            CircularPercentIndicator(
              radius: 150,
              backgroundColor: Colors.deepPurple.shade100,
              percent: (minuts * 60 + seconds) / (firstMin * 60),
              progressColor: Colors.deepPurple,
              circularStrokeCap: CircularStrokeCap.round,
              lineWidth: 20,
              center: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(minText, style: const TextStyle(fontSize: 50)),
                  const Text(":", style: TextStyle(fontSize: 50)),
                  Text(secText, style: const TextStyle(fontSize: 50)),
                ],
              ),
            ),
            const SizedBox(height: 70),
            buildButtons(),
            const SizedBox(height: 20),
            Text(
              "Your pomodoroes: $pomodoroes",
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;

    return isRunning
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SuperButton(
                    text: isRunning ? "Pause" : "Resume",
                    onTap: () {
                      setState(() {
                        if (isRunning) {
                          pause();
                        } else {
                          start();
                        }
                      });
                    },
                    onDoubleTap: () {},
                  ),
                  const SizedBox(width: 15),
                  SuperButton(
                    text: "Restart",
                    onTap: restart,
                    onDoubleTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MyButtonWaite(
                label: "Give Up",
                onPressed: () {
                  timer?.cancel();
                  player.play(
                    AssetSource(
                      "just_do_it.mp3",
                    ),
                  );
                  _showdialog();
                },
                timeOutInSeconds: 5,
              ),
            ],
          )
        : SuperButton(
            text: "Start",
            onTap: () async {
              start();
              Wakelock.enable();
            },
            onDoubleTap: onDouble,
          );
  }
}
