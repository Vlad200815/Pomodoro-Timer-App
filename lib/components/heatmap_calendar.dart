import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:hello/data/pomo_day_time_database.dart';

class MyHeatMap extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;
  const MyHeatMap({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      datasets: datasets,
      startDate: createDateTimeObject(startDate),
      endDate: DateTime.now().add(const Duration(days: 0)),
      colorMode: ColorMode.opacity,
      showText: true,
      scrollable: true,
      showColorTip: false,
      size: 40,
      colorsets: const {
        1: Color.fromARGB(255, 255, 34, 67),
        2: Color.fromRGBO(22, 187, 83, 1),
        3: Color.fromRGBO(238, 255, 0, 1),
        4: Color.fromRGBO(93, 0, 255, 1),
        5: Color.fromRGBO(255, 0, 217, 1),
      },
    );
  }
}
