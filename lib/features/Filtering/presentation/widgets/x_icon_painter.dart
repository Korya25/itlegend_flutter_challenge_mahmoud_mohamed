import 'package:flutter/material.dart';

class XIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const color = Color(0xFF090F1F);

    final paint = Paint()
      ..color = color
      ..strokeWidth = 0
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(12.0008, 13.4);
    path.lineTo(9.10078, 16.3);
    path.cubicTo(8.91745, 16.4833, 8.68411, 16.575, 8.40078, 16.575);
    path.cubicTo(8.11745, 16.575, 7.88411, 16.4833, 7.70078, 16.3);
    path.cubicTo(7.51745, 16.1167, 7.42578, 15.8833, 7.42578, 15.6);
    path.cubicTo(7.42578, 15.3167, 7.51745, 15.0833, 7.70078, 14.9);
    path.lineTo(10.6008, 12);
    path.lineTo(7.70078, 9.125);
    path.cubicTo(7.51745, 8.94166, 7.42578, 8.70833, 7.42578, 8.425);
    path.cubicTo(7.42578, 8.14166, 7.51745, 7.90833, 7.70078, 7.725);
    path.cubicTo(7.88411, 7.54166, 8.11745, 7.45, 8.40078, 7.45);
    path.cubicTo(8.68411, 7.45, 8.91745, 7.54166, 9.10078, 7.725);
    path.lineTo(12.0008, 10.625);
    path.lineTo(14.8758, 7.725);
    path.cubicTo(15.0591, 7.54166, 15.2924, 7.45, 15.5758, 7.45);
    path.cubicTo(15.8591, 7.45, 16.0924, 7.54166, 16.2758, 7.725);
    path.cubicTo(16.4758, 7.925, 16.5758, 8.1625, 16.5758, 8.4375);
    path.cubicTo(16.5758, 8.7125, 16.4758, 8.94166, 16.2758, 9.125);
    path.lineTo(13.3758, 12);
    path.lineTo(16.2758, 14.9);
    path.cubicTo(16.4591, 15.0833, 16.5508, 15.3167, 16.5508, 15.6);
    path.cubicTo(16.5508, 15.8833, 16.4591, 16.1167, 16.2758, 16.3);
    path.cubicTo(16.0758, 16.5, 15.8383, 16.6, 15.5633, 16.6);
    path.cubicTo(15.2883, 16.6, 15.0591, 16.5, 14.8758, 16.3);
    path.lineTo(12.0008, 13.4);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(XIconPainter oldDelegate) => false;
}
