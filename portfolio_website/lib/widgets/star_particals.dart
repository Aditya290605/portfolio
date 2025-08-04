import 'dart:math';
import 'package:flutter/material.dart';

class StarParticleBackground extends StatefulWidget {
  const StarParticleBackground({super.key});

  @override
  State<StarParticleBackground> createState() => _StarParticleBackgroundState();
}

class _StarParticleBackgroundState extends State<StarParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_StarParticle> _stars = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    // Generate random stars
    final random = Random();
    for (int i = 0; i < 100; i++) {
      _stars.add(
        _StarParticle(
          dx: random.nextDouble(),
          dy: random.nextDouble(),
          radius: random.nextDouble() * 1.5 + 0.5,
          speed: random.nextDouble() * 0.0003 + 0.0001,
          opacity: random.nextDouble() * 0.8 + 0.2,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return CustomPaint(
          painter: _StarPainter(_stars, _controller.value),
          child: Container(),
        );
      },
    );
  }
}

class _StarParticle {
  double dx;
  double dy;
  double radius;
  double speed;
  double opacity;

  _StarParticle({
    required this.dx,
    required this.dy,
    required this.radius,
    required this.speed,
    required this.opacity,
  });
}

class _StarPainter extends CustomPainter {
  final List<_StarParticle> stars;
  final double animationValue;

  _StarPainter(this.stars, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (var star in stars) {
      star.dy += star.speed;
      if (star.dy > 1.0) star.dy = 0.0;

      paint.color = Colors.white.withOpacity(star.opacity);
      canvas.drawCircle(
        Offset(star.dx * size.width, star.dy * size.height),
        star.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
