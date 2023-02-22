import 'dart:ui';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
class DrawingArea extends StatefulWidget {
  @override
  _DrawingAreaState createState() => _DrawingAreaState();
}

class _DrawingAreaState extends State<DrawingArea> {
  List<List<DrawModel?>> _points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (details) {
        setState(() {
          _points.add([DrawModel(details.localPosition, Paint())]);
        });
      },
      onPanUpdate: (details) {
        setState(() {
          _points.last.add(DrawModel(details.localPosition, Paint()));
        });
      },
      onPanEnd: (details) {
        setState(() {
          _points.last.add(null);
        });
      },
      child: CustomPaint(
        painter: DrawingPainter(_points),
        size: Size.infinite,
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<List<DrawModel?>> points;

  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    for (var pointList in points) {
      for (int i = 0; i < pointList.length - 1; i++) {
        if (pointList[i] != null && pointList[i + 1] != null) {
          canvas.drawLine(
            pointList[i]!.offset,
            pointList[i + 1]!.offset,
            pointList[i]!.paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DrawModel {
  final Offset offset;
  final Paint paint;

  DrawModel(this.offset, this.paint);
}
