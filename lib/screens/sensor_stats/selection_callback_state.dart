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
  double _measure;

  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    int number;
    double measure;

    if (selectedDatum.isNotEmpty) {
      number = selectedDatum.first.datum.number;
      measure = selectedDatum.first.datum.measure;
    }

    // Request a build.
    setState(() {
      _number = number;
      _measure = measure;
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

      children.add(
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Medida: $_measure',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    return Row(children: children);
  }
}

/// Sample time series data type.
