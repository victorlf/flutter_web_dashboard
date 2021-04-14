import 'package:charts_flutter/flutter.dart' as charts;

class Measure {
  final int number;
  final double measure;

  Measure(this.number, this.measure);
}

getMeasureData(data) {
  List<charts.Series<Measure, int>> series = [
    charts.Series(
        id: "Temperature",
        data: data,
        domainFn: (Measure series, _) => series.number,
        measureFn: (Measure series, _) => series.measure,
        colorFn: (Measure series, _) =>
            charts.MaterialPalette.purple.shadeDefault)
  ];
  return series;
}

getTwoMeasureData(data1, data2) {
  List<charts.Series<Measure, int>> series = [
    charts.Series(
        id: "1",
        data: data1,
        domainFn: (Measure series, _) => series.number,
        measureFn: (Measure series, _) => series.measure,
        colorFn: (Measure series, _) =>
            charts.MaterialPalette.red.shadeDefault),
    charts.Series(
        id: "2",
        data: data2,
        domainFn: (Measure series, _) => series.number,
        measureFn: (Measure series, _) => series.measure,
        colorFn: (Measure series, _) =>
            charts.MaterialPalette.blue.shadeDefault)
  ];
  return series;
}
