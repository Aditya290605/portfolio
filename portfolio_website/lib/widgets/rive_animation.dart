import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide LinearGradient;

class AnimatedRiveWidget extends StatefulWidget {
  final Artboard? riveArtboard;
  final Function(bool) onRiveInteraction;

  const AnimatedRiveWidget({
    super.key,
    required this.riveArtboard,
    required this.onRiveInteraction,
  });

  @override
  State<AnimatedRiveWidget> createState() => _AnimatedRiveWidgetState();
}

class _AnimatedRiveWidgetState extends State<AnimatedRiveWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 1.0,
      upperBound: 1.03,
    );
  }

  void _onHover(bool hovering) {
    widget.onRiveInteraction(hovering);
    if (hovering) {
      _hoverController.forward();
    } else {
      _hoverController.reverse();
    }
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 768;
    return !isMobile
        ? Expanded(
            flex: 1,
            child: Center(
              child: MouseRegion(
                onEnter: (_) => _onHover(true),
                onExit: (_) => _onHover(false),
                child: ScaleTransition(
                  scale: _hoverController,
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.05),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.3),
                          blurRadius: 40,
                          spreadRadius: 5,
                          offset: const Offset(0, 20),
                        ),
                      ],
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Rive or Placeholder
                          widget.riveArtboard == null
                              ? Container(
                                  color: Colors.grey.withOpacity(0.05),
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.animation,
                                          size: 64,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          'Rive Animation Placeholder',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Add your animation.riv file to assets/animations/',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Rive(artboard: widget.riveArtboard!),

                          // Optional blur glass layer
                          Container(color: Colors.transparent),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox.shrink(); // For mobile you can show a different UI
  }
}
