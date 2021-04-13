// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class StatusGraph extends StatefulWidget {
//   @override
//   _StatusGraphState createState() => _StatusGraphState();
// }

// class _StatusGraphState extends State<StatusGraph> {
//   final List<Node> node1 = [];
//   final List<Node> node2 = [];
//   final List<Node> node3 = [];
//   final List<Node> node4 = [];
//   final List<Node> node5 = [];

//   void readFireStoreEachNode() {
//     FirebaseFirestore.instance
//         .collection('nodes')
//         .snapshots()
//         .listen((snapshot) {
//       snapshot.docs.forEach((element) {
//         setState(() {
//           if (element.data()['name'] == 'Beacon 1') {
//             node1.add(Node(element.data()['name'], element.data()['accesses']));
//           } else if (element.data()['name'] == 'Beacon 2') {
//             node2.add(Node(element.data()['name'], element.data()['accesses']));
//           } else if (element.data()['name'] == 'Beacon 3') {
//             node3.add(Node(element.data()['name'], element.data()['accesses']));
//           } else if (element.data()['name'] == 'Beacon 4') {
//             node4.add(Node(element.data()['name'], element.data()['accesses']));
//           } else if (element.data()['name'] == 'Beacon 5') {
//             node5.add(Node(element.data()['name'], element.data()['accesses']));
//           }
//         });
//       });
//     });
//   }

//   List<charts.Series<Node, String>> streamData() {
//     readFireStoreEachNode();
//     return [
//       charts.Series<Node, String>(
//         id: 'Beacon 1',
//         colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
//         domainFn: (Node measures, _) => measures.name,
//         measureFn: (Node measures, _) => measures.access,
//         data: node1,
//       ),
//       charts.Series<Node, String>(
//         id: 'Beacon 2',
//         colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
//         domainFn: (Node measures, _) => measures.name,
//         measureFn: (Node measures, _) => measures.access,
//         data: node2,
//       ),
//       charts.Series<Node, String>(
//         id: 'Beacon 3',
//         colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
//         domainFn: (Node measures, _) => measures.name,
//         measureFn: (Node measures, _) => measures.access,
//         data: node3,
//       ),
//       charts.Series<Node, String>(
//         id: 'Beacon 4',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (Node measures, _) => measures.name,
//         measureFn: (Node measures, _) => measures.access,
//         data: node4,
//       ),
//       charts.Series<Node, String>(
//         id: 'Beacon 5',
//         colorFn: (_, __) => charts.MaterialPalette.cyan.shadeDefault,
//         domainFn: (Node measures, _) => measures.name,
//         measureFn: (Node measures, _) => measures.access,
//         data: node5,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           children: [
//             Container(
//               // width: MediaQuery.of(context).size.width * 0.5,
//               // height: MediaQuery.of(context).size.height * 0.5,
//               height: 500.0,
//               width: 800.0,
//               //child: charts.LineChart(
//               child: charts.BarChart(
//                 streamData(),
//                 animate: false,
//                 barGroupingType: charts.BarGroupingType.grouped,
//                 behaviors: [
//                   charts.ChartTitle('Plot of Calculated Distance x RSS',
//                       behaviorPosition: charts.BehaviorPosition.top,
//                       titleOutsideJustification:
//                           charts.OutsideJustification.start,
//                       innerPadding: 18),
//                   charts.ChartTitle('Nodes',
//                       behaviorPosition: charts.BehaviorPosition.bottom,
//                       titleOutsideJustification:
//                           charts.OutsideJustification.middleDrawArea),
//                   charts.ChartTitle('Quantity of Access',
//                       behaviorPosition: charts.BehaviorPosition.start,
//                       titleOutsideJustification:
//                           charts.OutsideJustification.middleDrawArea),
//                   charts.SeriesLegend(position: charts.BehaviorPosition.end),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Node {
//   final String name;
//   final int access;

//   Node(this.name, this.access);
// }
