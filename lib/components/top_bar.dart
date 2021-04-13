import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String title;

  TopBar(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70.0,
      //margin: EdgeInsets.only(bottom: 10.0),
      //width: double.maxFinite,
      padding: EdgeInsets.all(10.0),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.3),
      //       spreadRadius: 3,
      //       blurRadius: 7,
      //       //offset: Offset(0, 3), // changes position of shadow
      //     ),
      //   ],
      // ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      //child: Image.asset('images/logo-nib.jpeg'),
    );
  }
}
