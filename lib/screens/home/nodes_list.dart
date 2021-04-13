// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_web_dashboard/screens/home/ProjectProgressCard.dart';
// import 'package:flutter_web_dashboard/utilities/constants.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:timeago/timeago.dart' as timeago;

// class NodesList extends StatefulWidget {
//   @override
//   _NodesListState createState() => _NodesListState();
// }

// class _NodesListState extends State<NodesList> {
//   final double _itemSize = 200.0;
//   _moveLeft() {
//     _controller.animateTo(_controller.offset - _itemSize,
//         curve: Curves.linear, duration: Duration(milliseconds: 500));
//   }

//   _moveRight() {
//     _controller.animateTo(_controller.offset + _itemSize,
//         curve: Curves.linear, duration: Duration(milliseconds: 500));
//   }

//   ScrollController _controller;

//   @override
//   void initState() {
//     _controller = ScrollController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //margin: EdgeInsets.only(top: 5.0, left: 100.0, right: 100.0),
//       height: 200.0,
//       child: Row(
//         //alignment: Alignment.centerLeft,
//         children: [
//           GestureDetector(
//             child: Icon(
//               FontAwesomeIcons.arrowAltCircleLeft,
//               size: 30.0,
//             ),
//             onTap: () {
//               _moveLeft();
//             },
//           ),
//           SizedBox(
//             width: 10.0,
//           ),
//           Expanded(
//             child: StreamBuilder(
//                 stream:
//                     FirebaseFirestore.instance.collection('nodes').snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) return Center(child: kProgressCircle);
//                   return ListView.separated(
//                     controller: _controller,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: snapshot.data.size,
//                     itemBuilder: (context, index) => ProjectProgressCard(
//                       color: snapshot.data.docs[index]['task'] == 'Exposição'
//                           ? Color(0xffFF4C60)
//                           : Color(0xff6C6CE5),
//                       projectName: snapshot.data.docs[index]['task'],
//                       percentComplete: '34%',
//                       progressIndicatorColor:
//                           snapshot.data.docs[index]['task'] == 'Exposição'
//                               ? Colors.redAccent[100]
//                               : Colors.blue[200],
//                       icon: snapshot.data.docs[index]['task'] == 'Exposição'
//                           ? Icons.museum
//                           : FontAwesomeIcons.book,
//                       name: snapshot.data.docs[index]['name'],
//                       date: timeago.format(
//                           snapshot.data.docs[index]['input_date'].toDate()),
//                     ),
//                     separatorBuilder: (context, index) => SizedBox(width: 20),
//                     // children: [
//                     //   SizedBox(width: 20),
//                     //   ProjectProgressCard(
//                     //     color: Color(0xffFF4C60),
//                     //     projectName: 'Exposição',
//                     //     percentComplete: '34%',
//                     //     progressIndicatorColor: Colors.redAccent[100],
//                     //     icon: Icons.museum,
//                     //   ),
//                     //   SizedBox(width: 20),
//                     //   ProjectProgressCard(
//                     //       color: Color(0xff6C6CE5),
//                     //       projectName: 'Estante',
//                     //       percentComplete: '78%',
//                     //       progressIndicatorColor: Colors.blue[200],
//                     //       icon: FontAwesomeIcons.book),
//                     //   SizedBox(width: 20),
//                     //   ProjectProgressCard(
//                     //     color: Color(0xffFF4C60),
//                     //     projectName: 'Exposição',
//                     //     percentComplete: '34%',
//                     //     progressIndicatorColor: Colors.redAccent[100],
//                     //     icon: Icons.museum,
//                     //   ),
//                     //   SizedBox(width: 20),
//                     //   ProjectProgressCard(
//                     //       color: Color(0xff6C6CE5),
//                     //       projectName: 'Estante',
//                     //       percentComplete: '78%',
//                     //       progressIndicatorColor: Colors.blue[200],
//                     //       icon: FontAwesomeIcons.book),
//                     //   SizedBox(width: 20),
//                     //   ProjectProgressCard(
//                     //     color: Color(0xffFF4C60),
//                     //     projectName: 'Exposição',
//                     //     percentComplete: '34%',
//                     //     progressIndicatorColor: Colors.redAccent[100],
//                     //     icon: Icons.museum,
//                     //   ),
//                     //   SizedBox(width: 20),
//                     //   ProjectProgressCard(
//                     //       color: Color(0xff6C6CE5),
//                     //       projectName: 'Estante',
//                     //       percentComplete: '78%',
//                     //       progressIndicatorColor: Colors.blue[200],
//                     //       icon: FontAwesomeIcons.book),
//                     //   SizedBox(width: 20),
//                     // ],
//                     //),
//                   );
//                 }),
//           ),
//           SizedBox(
//             width: 10.0,
//           ),
//           GestureDetector(
//             child: Icon(
//               FontAwesomeIcons.arrowAltCircleRight,
//               size: 30.0,
//             ),
//             onTap: () {
//               _moveRight();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
