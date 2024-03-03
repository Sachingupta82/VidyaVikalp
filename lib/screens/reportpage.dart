import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportScreen extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList = [
    charts.Series<dynamic, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (dynamic sales, _) => sales['month'],
      measureFn: (dynamic sales, _) => sales['amount'],
      data: [
        {'month': 'Chapter: 1', 'amount': 5},
        {'month': 'Chapter: 2', 'amount': 7},
        {'month': 'Chapter: 3', 'amount': 3},
        {'month': 'Chapter: 4', 'amount': 9},
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Chart',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200, // Specify the desired height
              child: charts.BarChart(
                seriesList,
                animate: true,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Text(
                  "Total test: ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text("0",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
              ],
            ),
            const SizedBox(
              height: 29,
            ),
            const Row(
              children: [
                Text(
                  "Learning speed: ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text("Good",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
              ],
            )
          ],
        ),
      ),
    );
  }
}
