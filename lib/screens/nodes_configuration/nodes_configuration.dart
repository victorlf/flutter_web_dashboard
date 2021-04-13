// import 'package:flutter/material.dart';
// import 'package:flutter_web_dashboard/components/top_bar.dart';
// import 'package:flutter_web_dashboard/components/top_title.dart';
// import 'package:flutter_web_dashboard/providers/select_local.dart';
// import 'package:flutter_web_dashboard/screens/centered_view/centered_view.dart';
// import 'package:flutter_web_dashboard/screens/navigation_bar/navigation_bar.dart';
// import 'package:flutter_web_dashboard/utilities/constants.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:timeago/timeago.dart' as timeago;

// class NodesConfiguration extends StatelessWidget {
//   static const String id = 'nodes_configuration';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           NavigationBar(),
//           Expanded(
//             child: Column(
//               children: [
//                 TopBar('Beacons'),
//                 Expanded(
//                   child: CenteredView(
//                     child: StreamBuilder(
//                         stream: FirebaseFirestore.instance
//                             .collection('nodes')
//                             .snapshots(),
//                         builder: (context, snapshot) {
//                           if (!snapshot.hasData)
//                             return Center(child: kProgressCircle);
//                           return ListView.separated(
//                             scrollDirection: Axis.vertical,
//                             itemCount: snapshot.data.size,
//                             itemBuilder: (context, index) => Theme(
//                               data: ThemeData(
//                                 accentColor: Color(0xFF3C42BA),
//                               ),
//                               child: ExpansionTile(
//                                 title: Text(
//                                   snapshot.data.docs[index]['name'],
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                                 //subtitle: Text("  Explore the world of H-D"),
//                                 trailing: Icon(FontAwesomeIcons.plusCircle),
//                                 children: <Widget>[
//                                   Container(
//                                     padding: EdgeInsets.all(15.0),
//                                     child: Row(
//                                       children: [
//                                         Container(
//                                           height: 30.0,
//                                           width: 30.0,
//                                           child: Icon(
//                                             snapshot.data.docs[index]['task'] ==
//                                                     "Exposição"
//                                                 ? Icons.museum
//                                                 : FontAwesomeIcons.book,
//                                             color: Colors.white,
//                                             size: 16.0,
//                                           ),
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(30.0),
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 13.0,
//                                         ),
//                                         snapshot.data.docs[index]['task'] ==
//                                                 "Exposição"
//                                             ? Text('Exposição')
//                                             : Text('Estante'),
//                                         SizedBox(
//                                           width: 18.0,
//                                         ),
//                                         Container(
//                                           height: 13.0,
//                                           width: 13.0,
//                                           child: Icon(
//                                             FontAwesomeIcons.clock,
//                                             size: 13.0,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 8.0,
//                                         ),
//                                         Container(
//                                           child: Text(
//                                             timeago.format(snapshot
//                                                 .data.docs[index]['input_date']
//                                                 .toDate()),
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 10.0,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 18.0,
//                                         ),
//                                         FlatButton(
//                                           child: Row(
//                                             children: [
//                                               Icon(Icons.settings,
//                                                   color: Colors.white),
//                                               Text(
//                                                 'Configurações',
//                                                 style: TextStyle(
//                                                     color: Colors.white),
//                                               ),
//                                             ],
//                                           ),
//                                           color: Color(0xFF333951),
//                                           onPressed: () {},
//                                         )
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             separatorBuilder: (context, index) => Divider(
//                               thickness: 1.0,
//                               color: Colors.grey,
//                               height: 3.0,
//                             ),
//                           );
//                         }),
//                     // child: ListView.separated(
//                     //   scrollDirection: Axis.vertical,
//                     //   itemCount: 5,
//                     //   itemBuilder: (context, index) => Theme(
//                     //     data: ThemeData(
//                     //       accentColor: Color(0xFF3C42BA),
//                     //     ),
//                     //     child: ExpansionTile(
//                     //       title: Text(
//                     //         "Beacon $index",
//                     //         style: TextStyle(fontWeight: FontWeight.w600),
//                     //       ),
//                     //       //subtitle: Text("  Explore the world of H-D"),
//                     //       trailing: Icon(FontAwesomeIcons.plusCircle),
//                     //       children: <Widget>[
//                     //         Container(
//                     //           padding: EdgeInsets.all(15.0),
//                     //           child: Row(
//                     //             children: [
//                     //               Container(
//                     //                 height: 30.0,
//                     //                 width: 30.0,
//                     //                 child: Icon(
//                     //                   index % 2 == 0
//                     //                       ? Icons.museum
//                     //                       : FontAwesomeIcons.book,
//                     //                   color: Colors.white,
//                     //                   size: 16.0,
//                     //                 ),
//                     //                 decoration: BoxDecoration(
//                     //                   borderRadius: BorderRadius.circular(30.0),
//                     //                   color: Colors.black,
//                     //                 ),
//                     //               ),
//                     //               SizedBox(
//                     //                 width: 13.0,
//                     //               ),
//                     //               index % 2 == 0
//                     //                   ? Text('Exposição')
//                     //                   : Text('Estante'),
//                     //               SizedBox(
//                     //                 width: 18.0,
//                     //               ),
//                     //               Container(
//                     //                 height: 13.0,
//                     //                 width: 13.0,
//                     //                 child: Icon(
//                     //                   FontAwesomeIcons.clock,
//                     //                   size: 13.0,
//                     //                   color: Colors.black,
//                     //                 ),
//                     //               ),
//                     //               SizedBox(
//                     //                 width: 8.0,
//                     //               ),
//                     //               Container(
//                     //                 child: Text(
//                     //                   '10 Jan 2021',
//                     //                   style: TextStyle(
//                     //                     fontWeight: FontWeight.w500,
//                     //                     fontSize: 10.0,
//                     //                     color: Colors.black,
//                     //                   ),
//                     //                 ),
//                     //               ),
//                     //               SizedBox(
//                     //                 width: 18.0,
//                     //               ),
//                     //               FlatButton(
//                     //                 child: Row(
//                     //                   children: [
//                     //                     Icon(Icons.settings,
//                     //                         color: Colors.white),
//                     //                     Text(
//                     //                       'Configurações',
//                     //                       style: TextStyle(color: Colors.white),
//                     //                     ),
//                     //                   ],
//                     //                 ),
//                     //                 color: Color(0xFF333951),
//                     //                 onPressed: () {},
//                     //               )
//                     //             ],
//                     //           ),
//                     //         )
//                     //       ],
//                     //     ),
//                     //   ),
//                     //   separatorBuilder: (context, index) => Divider(
//                     //     thickness: 1.0,
//                     //     color: Colors.grey,
//                     //     height: 3.0,
//                     //   ),
//                     // ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// // class LocalDropDown extends StatelessWidget {
// //   String selected_item;

// //   LocalDropDown(this.selected_item);

// //   @override
// //   Widget build(final BuildContext context) {
// //     return Consumer<SelectLocal>(
// //       builder: (context, selectLocal, child) {
// //         return DropdownButton<String>(
// //           hint: const Text("Not selected"),
// //           icon: const Icon(FontAwesomeIcons.mapMarked),
// //           value: selectLocal.selected,
// //           onChanged: (final String newValue) {
// //             selectLocal.selected = newValue;
// //           },
// //           items: selectLocal.items.map<DropdownMenuItem<String>>(
// //             (final String value) {
// //               return DropdownMenuItem<String>(
// //                 value: value,
// //                 child: Text(value),
// //               );
// //             },
// //           ).toList(),
// //         );
// //       },
// //     );
// //   }
// // }
