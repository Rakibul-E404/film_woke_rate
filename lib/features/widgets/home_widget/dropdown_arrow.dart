import 'package:flutter/cupertino.dart';

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint()
      ..color = const Color(0xFF0D1F33)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = const Color(0xFF1E3A55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(size.width / 2, 0)       // tip pointing UP
      ..lineTo(size.width, size.height)  // bottom-right
      ..lineTo(0, size.height)           // bottom-left
      ..close();

    // Draw border first, then fill on top so border shows only on outside edges
    canvas.drawPath(path, borderPaint);
    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}