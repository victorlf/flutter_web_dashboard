import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String title1;
  final String title2;
  final Color color;

  StatusCard(this.title1, this.title2, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50.0,
      width: 400.0,
      //constraints: BoxConstraints(minWidth: 100, maxWidth: 400),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            const Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title1,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title2,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
