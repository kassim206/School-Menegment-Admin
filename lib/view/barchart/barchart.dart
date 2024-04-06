import 'package:flutter/material.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:vertical_barchart/vertical-legend.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Adjust the container properties as needed
      child: BarChart(),
    );
  }
}

class BarChart extends StatefulWidget {
  BarChart({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  List<VBarChartModel> bardata = [
    VBarChartModel(
      index: 0,
      label: "Club",
      colors: [Colors.orange, Colors.deepOrange],
      jumlah: 20,
      tooltip: "3 Count",
      description: Text(
        "",
        style: TextStyle(fontSize: 10),
      ),
    ),
    VBarChartModel(
      index: 1,
      label: "Events",
      colors: [Colors.orange, Colors.deepOrange],
      jumlah: 55,
      tooltip: "7 Count",
      description: Text(
        "",
        style: TextStyle(fontSize: 10),
      ),
    ),
    VBarChartModel(
      index: 2,
      label: "Course",
      colors: [Colors.teal, Colors.indigo],
      jumlah: 12,
      tooltip: "8 Count",
    ),
    VBarChartModel(
      index: 3,
      label: "Location",
      colors: [Colors.teal, Colors.indigo],
      jumlah: 1,
      tooltip: "2 Pcs",
    ),
    VBarChartModel(
      index: 4,
      label: "Reg stds",
      colors: [Colors.orange, Colors.deepOrange],
      jumlah: 15,
      tooltip: "15 Cts",
    ),
    VBarChartModel(
      index: 5,
      label: "Notes",
      colors: [Colors.teal, Colors.indigo],
      jumlah: 30,
      tooltip: "10 Pdf",
      description: Text(
        "",
        style: TextStyle(fontSize: 10),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _buildGrafik(bardata);
  }

  Widget _buildGrafik(List<VBarChartModel> bardata) {
    return VerticalBarchart(
      maxX: 55,
      data: bardata,
      showLegend: true,
      showBackdrop: true,
      barStyle: BarStyle.CIRCLE,
      alwaysShowDescription: true,
      legend: [
        Vlegend(
          isSquare: false,
          color: Colors.orange,
          text: "Top",
        ),
        Vlegend(
          isSquare: false,
          color: Colors.teal,
          text: "Average",
        )
      ],
    );
  }
}
