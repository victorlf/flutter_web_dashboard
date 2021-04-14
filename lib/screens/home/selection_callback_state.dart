import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SelectionCallbackExample extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final String leftTitle;
  final String bottomTitle;

  SelectionCallbackExample({
    @required this.seriesList,
    @required this.animate,
    this.leftTitle,
    this.bottomTitle,
  });

  @override
  State<StatefulWidget> createState() => new _SelectionCallbackState();
}

class _SelectionCallbackState extends State<SelectionCallbackExample> {
  int _number;
  Map<String, double> _measures;

  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    int number;
    Map measures = <String, double>{};

    if (selectedDatum.isNotEmpty) {
      number = selectedDatum.first.datum.number;
      selectedDatum.forEach((charts.SeriesDatum datumPair) {
        measures[datumPair.series.displayName] = datumPair.datum.measure;
      });
    }

    // Request a build.
    setState(() {
      _number = number;
      _measures = measures;
    });
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      SizedBox(
          width: 450.0,
          child: charts.LineChart(widget.seriesList,
              animate: widget.animate,
              selectionModels: [
                charts.SelectionModelConfig(
                  type: charts.SelectionModelType.info,
                  changedListener: _onSelectionChanged,
                )
              ],
              behaviors: [
                charts.ChartTitle(widget.leftTitle,
                    behaviorPosition: charts.BehaviorPosition.start,
                    titleOutsideJustification:
                        charts.OutsideJustification.middleDrawArea),
                charts.ChartTitle(widget.bottomTitle,
                    behaviorPosition: charts.BehaviorPosition.bottom,
                    titleOutsideJustification:
                        charts.OutsideJustification.middleDrawArea),
              ])),
    ];

    if (_number != null) {
      // children.add(new Padding(
      //     padding: new EdgeInsets.only(top: 5.0),
      //     child: new Text(_number.toString())));
      List measuresColumn = <Widget>[];

      _measures.forEach((String series, num value) {
        //children.add(new Text('${series}: ${value}'));
        measuresColumn.add(
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: series == '1' ? Colors.red : Colors.blue,
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Sensor $series: $value',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      });

      children.add(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: measuresColumn,
      ));

      // children.add(
      //   Padding(
      //     padding: EdgeInsets.only(top: 5.0),
      //     child: Container(
      //       decoration: BoxDecoration(
      //         color: Colors.purple,
      //         borderRadius: BorderRadius.circular(30.0),
      //       ),
      //       padding: EdgeInsets.all(10.0),
      //       child: Text(
      //         'Medida: $_measure',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ),
      //   ),
      // );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}

/// Sample time series data type.
