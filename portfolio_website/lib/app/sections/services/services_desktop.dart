part of 'services.dart';

class ServiceDesktop extends StatefulWidget {
  const ServiceDesktop({Key? key}) : super(key: key);

  @override
  ServiceDesktopState createState() => ServiceDesktopState();
}

class ServiceDesktopState extends State<ServiceDesktop> {
  Widget _SkillCard({required SkillItem skill, required bool isMobile}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        width: isMobile ? 80 : 100,
        height: isMobile ? 80 : 100,
        decoration: BoxDecoration(
          color: const Color(0xFF21262D),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFF30363D), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              skill.icon,
              width: isMobile ? 28 : 36,
              height: isMobile ? 28 : 36,
            ),
            const SizedBox(height: 8),
            Text(
              skill.name,
              style: TextStyle(
                color: Colors.white70,
                fontSize: isMobile ? 10 : 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width / 8,
      ).copyWith(bottom: height * 0.2),
      child: Column(
        children: [
          const CustomSectionHeading(text: '\nWhat I can do?'),
          Space.y(1.w)!,
          CustomSectionSubHeading(text: servicesSubHeading),
          Space.y(2.w)!,
          Wrap(
            spacing: width * 0.02,
            runSpacing: height * 0.03,
            alignment: WrapAlignment.start,
            children: skillItems
                .map((skill) => _SkillCard(skill: skill, isMobile: false))
                .toList(),
          ),
        ],
      ),
    );
  }
}
