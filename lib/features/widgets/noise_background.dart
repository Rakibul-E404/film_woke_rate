import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class NoiseScreen extends StatelessWidget {
  const NoiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ColoredBox(
        color: Color(0xFF0A1F2E), // base dark navy (from 2nd image)
        child: NoiseLayer(),
      ),
    );
  }
}

class NoiseLayer extends StatefulWidget {
  const NoiseLayer({super.key});

  @override
  State<NoiseLayer> createState() => _NoiseLayerState();
}

class _NoiseLayerState extends State<NoiseLayer> {
  late final List<_NoisePoint> points;

  @override
  void initState() {
    super.initState();
    final random = Random(7);

    points = List.generate(45000, (_) {
      return _NoisePoint(
        dx: random.nextDouble(),
        dy: random.nextDouble(),
        brightness: random.nextDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: NoisePainter(points),
    );
  }
}

class _NoisePoint {
  final double dx;
  final double dy;
  final double brightness;

  _NoisePoint({
    required this.dx,
    required this.dy,
    required this.brightness,
  });
}

class NoisePainter extends CustomPainter {
  final List<_NoisePoint> points;

  NoisePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 1;

    for (final point in points) {
      // Dark navy tone variations from 2nd image
      Color color;

      if (point.brightness < 1.4) {
        // color = const Color(0xFF081822); // darkest
        color = const Color(0xFF081822); // darkest
      } else if (point.brightness < 0.75) {
        // color = const Color(0xFF0E2A3D); // mid
        color = const Color(0xFF081822); // mid
      } else {
        // color = const Color(0xFF153B55); // lighter blue speckle
        color = const Color(0xFF153B55); // lighter blue speckle
      }

      paint.color = color;

      canvas.drawPoints(
        PointMode.points,
        [
          Offset(
            point.dx * size.width,
            point.dy * size.height,
          )
        ],
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}