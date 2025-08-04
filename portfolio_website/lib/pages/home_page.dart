import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/star_particals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _nameController;
  late AnimationController _fadeController;
  late Animation<double> _nameAnimation;
  late Animation<double> _fadeAnimation;

  final List<String> _nameVariations = [
    'Aditya Magar',
    'Flutter Developer',
    'UI/UX Designer',
    'Problem Solver',
  ];
  int _currentNameIndex = 0;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startNameAnimation();
  }

  void _setupAnimations() {
    _nameController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _nameAnimation = Tween<double>(begin: -50.0, end: 0.0).animate(
      CurvedAnimation(parent: _nameController, curve: Curves.easeOutCubic),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _fadeController.forward();
  }

  void _startNameAnimation() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          _currentNameIndex = (_currentNameIndex + 1) % _nameVariations.length;
        });
        _nameController.reset();
        _nameController.forward();
      }
    });
    _nameController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 768;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0D1117), // GitHub dark background
            Color(0xFF161B22), // Slightly lighter
            Color(0xFF21262D), // Even lighter for depth
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Stack(
        children: [
          const Positioned.fill(child: StarParticleBackground()),
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 60,
                vertical: 40,
              ),
              child: Column(
                children: [
                  // Hero Section
                  SizedBox(
                    height: screenHeight * 0.85,
                    child: Center(
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Greeting
                            Text(
                              'Hello, I\'m',
                              style: TextStyle(
                                fontSize: isMobile ? 18 : 22,
                                color: const Color(0xFF7C3AED), // Purple accent
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Animated Name
                            SizedBox(
                              height: isMobile ? 50 : 65,
                              child: AnimatedBuilder(
                                animation: _nameAnimation,
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: Offset(_nameAnimation.value, 0),
                                    child: Opacity(
                                      opacity: _nameController.value,
                                      child: ShaderMask(
                                        shaderCallback: (bounds) =>
                                            const LinearGradient(
                                              colors: [
                                                Color(0xFF7C3AED), // Purple
                                                Color(0xFF3B82F6), // Blue
                                                Color(0xFF06B6D4), // Cyan
                                              ],
                                            ).createShader(bounds),
                                        child: Text(
                                          _nameVariations[_currentNameIndex],
                                          style: TextStyle(
                                            fontSize: isMobile ? 36 : 48,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(height: 24),

                            // Description
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: isMobile ? double.infinity : 600,
                              ),
                              child: Text(
                                'I create beautiful and functional mobile and web applications using Flutter. Passionate about clean code, great user experiences, and innovative solutions.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: isMobile ? 16 : 18,
                                  height: 1.7,
                                  color: const Color(0xFF8B949E), // GitHub gray
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),

                            const SizedBox(height: 40),

                            // Action Buttons
                            Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              children: [
                                _buildGradientButton('View My Work', true, () {
                                  // Navigate to projects
                                }),
                                _buildGradientButton('Contact Me', false, () {
                                  // Navigate to contact
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Skills Section
                  const SizedBox(height: 60),
                  _buildSkillsSection(context, isMobile),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientButton(
    String text,
    bool isPrimary,
    VoidCallback onPressed,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: isPrimary
            ? const LinearGradient(
                colors: [Color(0xFF7C3AED), Color(0xFF3B82F6)],
              )
            : null,
        border: isPrimary
            ? null
            : Border.all(color: const Color(0xFF30363D), width: 1.5),
        borderRadius: BorderRadius.circular(12),
        boxShadow: isPrimary
            ? [
                BoxShadow(
                  color: const Color(0xFF7C3AED).withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text(
              text,
              style: TextStyle(
                color: isPrimary ? Colors.white : const Color(0xFF7C3AED),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillsSection(BuildContext context, bool isMobile) {
    final skills = [
      {'name': 'Flutter', 'icon': '', 'color': Color(0xFF02569B)},
      {'name': 'Dart', 'icon': '', 'color': Color(0xFF0175C2)},
      {'name': 'Firebase', 'icon': '', 'color': Color(0xFFFFCA28)},
      {'name': 'JavaScript', 'icon': '', 'color': Color(0xFFF7DF1E)},
      {'name': 'React', 'icon': '', 'color': Color(0xFF61DAFB)},
      {'name': 'Node.js', 'icon': '', 'color': Color(0xFF339933)},
      {'name': 'Python', 'icon': '', 'color': Color(0xFF3776AB)},
      {'name': 'Git', 'icon': '', 'color': Color(0xFFF05032)},
    ];

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        children: [
          Text(
            'Skills & Technologies',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 4,
            width: 80,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF7C3AED), Color(0xFF3B82F6)],
              ),
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
          const SizedBox(height: 50),

          // Skills Grid
          Wrap(
            spacing: isMobile ? 16 : 24,
            runSpacing: isMobile ? 16 : 24,
            alignment: WrapAlignment.center,
            children: skills.map((skill) {
              return _buildSkillIcon(
                skill['name'] as String,
                skill['icon'] as String,
                skill['color'] as Color,
                isMobile,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillIcon(String name, String icon, Color color, bool isMobile) {
    return MouseRegion(
      onEnter: (_) {},
      onExit: (_) {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: isMobile ? 60 : 70,
              height: isMobile ? 60 : 70,
              decoration: BoxDecoration(
                color: const Color(0xFF21262D),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF30363D), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  icon,
                  style: TextStyle(fontSize: isMobile ? 24 : 28),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: TextStyle(
                color: const Color(0xFF8B949E),
                fontSize: isMobile ? 12 : 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _fadeController.dispose();
    super.dispose();
  }
}

// Add this import at the top
