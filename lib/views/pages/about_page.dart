import 'package:flutter/material.dart';
import 'package:smart_atu_nav/utils/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: AppConstants.titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Smart ATU Campus Navigation',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Enhancing Campus Navigation for a Smarter Experience',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24.0),
              Text(
                'Introduction',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Welcome to Smart ATU Campus Navigation! Our goal is to simplify and enhance navigation across the Accra Technical University campus. This application provides students, faculty, and visitors with an intuitive way to find their way around campus, access real-time updates, and manage appointments with ease.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 24.0),
              Text(
                'Features',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              const BulletPointList(
                items: [
                  'Interactive Campus Map: Explore an interactive map of the campus with detailed information about buildings, departments, and facilities.',
                  'Real-Time Updates: Receive real-time notifications and updates about campus events, changes, and alerts.',
                  'Availability Scheduling: Lecturers and staff can update their availability, making it easier for students to schedule meetings or appointments.',
                  'User-Friendly Interface: Designed with a focus on user experience, ensuring easy navigation and accessibility.',
                ],
              ),
              const SizedBox(height: 24.0),
              Text(
                'How It Works',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'The Smart ATU Campus Navigation application utilizes a combination of GPS technology and interactive maps to provide users with accurate and up-to-date information about the campus. Users can view detailed campus maps, receive real-time notifications, and manage appointments through a seamless and intuitive interface.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 24.0),
              Text(
                'Team',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              const BulletPointList(
                items: [
                  'Project Lead: Julius Boakye - Final Year Computer Science Student, Accra Technical University',
                  'Development Team: Joseph, Lincoln',
                ],
              ),
              const SizedBox(height: 24.0),
              Text(
                'Contact Information',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'For support, feedback, or inquiries, please reach out to us at:',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Email: juliusboakye@pythonghan.org',
              ),
              const Text(
                'Phone: +233 50 015 9892',
              ),
              const SizedBox(height: 24.0),
              Text(
                'Acknowledgments',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              const BulletPointList(
                items: [
                  'Flutter, ATU Library and our Supervisor, Joseph Gdzata for providing essential tools and libraries.',
                  'All Contributors for their invaluable support and contributions.',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BulletPointList extends StatelessWidget {
  final List<String> items;

  const BulletPointList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Icon(Icons.circle, size: 8.0, color: Colors.black),
                  const SizedBox(width: 8.0),
                  Expanded(child: Text(item, textAlign: TextAlign.justify)),
                ],
              ))
          .toList(),
    );
  }
}
