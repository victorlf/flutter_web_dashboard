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
