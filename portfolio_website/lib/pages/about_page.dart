import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  Future<void> _downloadResume() async {
    // Replace with your actual resume URL
    const resumeUrl = 'https://your-website.com/resume.pdf';

    try {
      if (await canLaunchUrl(Uri.parse(resumeUrl))) {
        await launchUrl(Uri.parse(resumeUrl));
      } else {
        throw 'Could not launch $resumeUrl';
      }
    } catch (e) {
      print('Error downloading resume: $e');
      // Show snackbar or dialog with error message
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 60,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page Title
            Center(
              child: Text(
                'About Me',
                style: TextStyle(
                  fontSize: isMobile ? 32 : 40,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Main Content
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Side - Profile Image
                if (!isMobile) ...[
                  Container(
                    width: 300,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person, size: 80, color: Colors.grey),
                              SizedBox(height: 16),
                              Text(
                                'Your Profile Photo',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 60),
                ],

                // Right Side - Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Introduction
                      Text(
                        'Hi there! 👋',
                        style: TextStyle(
                          fontSize: isMobile ? 24 : 28,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(
                            context,
                          ).textTheme.headlineLarge?.color,
                        ),
                      ),
                      const SizedBox(height: 20),

                      Text(
                        'I\'m a passionate Flutter developer with over 3 years of experience creating beautiful, performant mobile and web applications. I love turning complex problems into simple, beautiful, and intuitive solutions.',
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          height: 1.6,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                      const SizedBox(height: 24),

                      Text(
                        'My journey started with a curiosity about how apps work, and it has evolved into a deep passion for creating exceptional user experiences. I specialize in Flutter development, but I also have experience with native Android development, UI/UX design, and backend technologies.',
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          height: 1.6,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Resume Download Button
                      ElevatedButton.icon(
                        onPressed: _downloadResume,
                        icon: const Icon(Icons.download),
                        label: const Text('Download Resume'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Experience Section
            _buildExperienceSection(context, isMobile),

            const SizedBox(height: 60),

            // Education Section
            _buildEducationSection(context, isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceSection(BuildContext context, bool isMobile) {
    final experiences = [
      {
        'title': 'Senior Flutter Developer',
        'company': 'Tech Company Inc.',
        'period': '2022 - Present',
        'description':
            'Led development of multiple Flutter applications, mentored junior developers, and implemented best practices for code quality and performance.',
      },
      {
        'title': 'Flutter Developer',
        'company': 'Startup Solutions',
        'period': '2021 - 2022',
        'description':
            'Developed cross-platform mobile applications using Flutter, integrated REST APIs, and collaborated with design teams to implement pixel-perfect UIs.',
      },
      {
        'title': 'Mobile App Developer',
        'company': 'Digital Agency',
        'period': '2020 - 2021',
        'description':
            'Built native Android applications and transitioned to Flutter development. Worked on various client projects and gained experience in different industries.',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience',
          style: TextStyle(
            fontSize: isMobile ? 24 : 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 24),
        ...experiences.map(
          (exp) => _buildExperienceCard(context, exp, isMobile),
        ),
      ],
    );
  }

  Widget _buildExperienceCard(
    BuildContext context,
    Map<String, String> experience,
    bool isMobile,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  experience['title']!,
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.headlineMedium?.color,
                  ),
                ),
              ),
              Text(
                experience['period']!,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            experience['company']!,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyMedium?.color,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            experience['description']!,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationSection(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Education',
          style: TextStyle(
            fontSize: isMobile ? 24 : 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Bachelor of Computer Science',
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.color,
                      ),
                    ),
                  ),
                  Text(
                    '2016 - 2020',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'University Name',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Focused on software engineering, mobile app development, and user interface design. Graduated with honors and completed several projects in mobile development.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
