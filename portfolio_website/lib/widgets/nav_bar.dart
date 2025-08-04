import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const NavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo/Brand
          Text(
            'Portfolio',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),

          // Navigation Items
          if (isMobile)
            _buildMobileMenu(context)
          else
            _buildDesktopMenu(context),
        ],
      ),
    );
  }

  Widget _buildDesktopMenu(BuildContext context) {
    final navItems = ['Home', 'About', 'Projects', 'Contact'];

    return Row(
      children: [
        ...navItems.asMap().entries.map((entry) {
          final index = entry.key;
          final title = entry.value;
          final isSelected = currentIndex == index;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              onPressed: () => onItemTapped(index),
              style: TextButton.styleFrom(
                foregroundColor: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).textTheme.bodyLarge?.color,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          );
        }),
        const SizedBox(width: 16),
        // Theme Toggle Button
        IconButton(
          onPressed: onThemeToggle,
          icon: Icon(
            isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: Theme.of(context).primaryColor,
          ),
          tooltip: isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
        ),
      ],
    );
  }

  Widget _buildMobileMenu(BuildContext context) {
    return Row(
      children: [
        // Theme Toggle for Mobile
        IconButton(
          onPressed: onThemeToggle,
          icon: Icon(
            isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: Theme.of(context).primaryColor,
          ),
        ),
        // Mobile Menu Button
        PopupMenuButton<int>(
          onSelected: onItemTapped,
          icon: const Icon(Icons.menu),
          itemBuilder: (context) => [
            const PopupMenuItem(value: 0, child: Text('Home')),
            const PopupMenuItem(value: 1, child: Text('About')),
            const PopupMenuItem(value: 2, child: Text('Projects')),
            const PopupMenuItem(value: 3, child: Text('Contact')),
          ],
        ),
      ],
    );
  }
}
