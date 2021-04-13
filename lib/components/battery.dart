import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BatteryView extends StatefulWidget {
  final double electricQuantity;
  double width;
  double height;

  BatteryView(
      {Key key, this.electricQuantity, this.width = 27, this.height = 12})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BatteryViewState();
  }
}

class BatteryViewState extends State<BatteryView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
          size: Size(widget.width, widget.height),
          painter: BatteryViewPainter(widget.electricQuantity)),
    );
  }
}

class BatteryViewPainter extends CustomPainter {
  double electricQuantity;
  Paint mPaint;
  double mStrokeWidth = 1.0;
  double mPaintStrokeWidth = 1.5;

  BatteryViewPainter(electricQuantity) {
    this.electricQuantity = electricQuantity;
    mPaint = Paint()..strokeWidth = mPaintStrokeWidth;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //Battery head position
    double batteryHeadLeft = 0;
    double batteryHeadTop = size.height / 4;
    double batteryHeadRight = size.width / 15;
    double batteryHeadBottom = batteryHeadTop + (size.height / 2);

    //Battery box position
    double batteryLeft = batteryHeadRight + mStrokeWidth;
    double batteryTop = 0;
    double batteryRight = size.width;
    double batteryBottom = size.height;

    //Power position
    double electricQuantityTotalWidth = size.width -
        batteryHeadRight -
        4 * mStrokeWidth; //Battery minus the border minus the remaining width of the head

    double electricQuantityLeft = batteryHeadRight +
        2 * mStrokeWidth +
        electricQuantityTotalWidth * (1 - electricQuantity);
    double electricQuantityTop = mStrokeWidth * 2;
    double electricQuantityRight = size.width - 2 * mStrokeWidth;
    double electricQuantityBottom = size.height - 2 * mStrokeWidth;

    mPaint.style = PaintingStyle.fill;
    mPaint.color = Color(0x80ffffff);
    //Draw the battery head
    canvas.drawRRect(
        RRect.fromLTRBR(batteryHeadLeft, batteryHeadTop, batteryHeadRight,
            batteryHeadBottom, Radius.circular(mStrokeWidth)),
        mPaint);
    mPaint.style = PaintingStyle.stroke;
    //Draw the battery box
    canvas.drawRRect(
        RRect.fromLTRBR(batteryLeft, batteryTop, batteryRight, batteryBottom,
            Radius.circular(mStrokeWidth)),
        mPaint);
    mPaint.style = PaintingStyle.fill;
    mPaint.color = Colors.white;
    //Draw the battery level
    canvas.drawRRect(
        RRect.fromLTRBR(
            electricQuantityLeft,
            electricQuantityTop,
            electricQuantityRight,
            electricQuantityBottom,
            Radius.circular(mStrokeWidth)),
        mPaint);
  }

  @override
  bool shouldRepaint(BatteryViewPainter other) {
    return true;
  }
}
