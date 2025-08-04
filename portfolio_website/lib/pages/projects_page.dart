import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  Future<void> _launchGitHub(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching GitHub: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    // Sample projects data
    final projects = [
      {
        'title': 'E-Commerce Flutter App',
        'description':
            'A full-featured e-commerce application with user authentication, product catalog, shopping cart, and payment integration.',
        'image': 'assets/images/project1.png',
        'github': 'https://github.com/yourusername/ecommerce-app',
        'technologies': ['Flutter', 'Firebase', 'Stripe', 'Provider'],
      },
      {
        'title': 'Weather Forecast App',
        'description':
            'Beautiful weather application with location-based forecasts, interactive maps, and detailed weather information.',
        'image': 'assets/images/project2.png',
        'github': 'https://github.com/yourusername/weather-app',
        'technologies': ['Flutter', 'REST API', 'Geolocator', 'Charts'],
      },
      {
        'title': 'Task Management App',
        'description':
            'Productivity app with task creation, categorization, reminders, and team collaboration features.',
        'image': 'assets/images/project3.png',
        'github': 'https://github.com/yourusername/task-manager',
        'technologies': ['Flutter', 'SQLite', 'Notifications', 'BLoC'],
      },
      {
        'title': 'Social Media Dashboard',
        'description':
            'Analytics dashboard for social media management with real-time data visualization and reporting.',
        'image': 'assets/images/project4.png',
        'github': 'https://github.com/yourusername/social-dashboard',
        'technologies': ['Flutter Web', 'Charts', 'REST API', 'Responsive'],
      },
      {
        'title': 'Fitness Tracking App',
        'description':
            'Health and fitness application with workout tracking, progress monitoring, and personalized recommendations.',
        'image': 'assets/images/project5.png',
        'github': 'https://github.com/yourusername/fitness-app',
        'technologies': ['Flutter', 'HealthKit', 'Charts', 'Local Storage'],
      },
      {
        'title': 'Recipe Sharing Platform',
        'description':
            'Community-driven recipe sharing app with search functionality, ratings, and cooking timers.',
        'image': 'assets/images/project6.png',
        'github': 'https://github.com/yourusername/recipe-app',
        'technologies': ['Flutter', 'Firebase', 'Image Upload', 'Search'],
      },
    ];

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 60,
          vertical: 40,
        ),
        child: Column(
          children: [
            // Page Title
            Text(
              'My Projects',
              style: TextStyle(
                fontSize: isMobile ? 32 : 40,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Here are some of the projects I\'ve worked on. Each project showcases different aspects of Flutter development and various integrations.',
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                color: Theme.of(context).textTheme.bodyLarge?.color,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Projects Grid
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount;
                if (constraints.maxWidth > 1200) {
                  crossAxisCount = 3;
                } else if (constraints.maxWidth > 800) {
                  crossAxisCount = 2;
                } else {
                  crossAxisCount = 1;
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return _buildProjectCard(
                      context,
                      projects[index],
                      isMobile,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    Map<String, dynamic> project,
    bool isMobile,
  ) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Container(
                    // Placeholder for project image
                    // Replace with: Image.asset(project['image'], fit: BoxFit.cover)
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, size: 48, color: Colors.grey),
                          SizedBox(height: 8),
                          Text(
                            'Project Screenshot',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Project Details
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project Title
                    Text(
                      project['title'],
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.color,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),

                    // Project Description
                    Expanded(
                      child: Text(
                        project['description'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          height: 1.4,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Technologies
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: (project['technologies'] as List<String>)
                          .take(3) // Show only first 3 technologies
                          .map(
                            (tech) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                tech,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 16),

                    // GitHub Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => _launchGitHub(project['github']),
                        icon: const Icon(Icons.code, size: 18),
                        label: const Text('View Code'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
