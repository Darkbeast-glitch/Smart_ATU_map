import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_atu_nav/utils/cards.dart';
import 'package:smart_atu_nav/utils/constants.dart';
import 'package:smart_atu_nav/views/pages/direction_page.dart';
import 'package:smart_atu_nav/views/pages/feedback_page.dart';
import 'package:smart_atu_nav/views/pages/lecturer_page.dart';
import 'package:smart_atu_nav/views/pages/map_page.dart';
import 'package:smart_atu_nav/views/pages/notification_event_page.dart';
import 'package:smart_atu_nav/views/pages/profile_page.dart';
import 'package:smart_atu_nav/views/pages/search_page.dart';
import 'package:smart_atu_nav/views/pages/study_space.dart';
import 'package:smart_atu_nav/providers/bottom_navigation_state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentPageIndexProvider);

    // Define initial coordinates for the MapPage
    const LatLng initialCoordinates =
        LatLng(5.5542073460925465, -0.20596014491761958); // Example coordinates

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            const Gap(10),
            _buildInstructions(),
            const Gap(10),
            _buildGrid(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
          // For example, navigate to a Teacher Information Page
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    const LectureInfoPage()), // Replace with your page
          );
        }, // Use the teacher icon here
        tooltip: 'Lecturer Tracker ',
        child: const Icon(Icons.person),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(currentPageIndexProvider.notifier).state = index;
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MapPage(initialCoordinates: initialCoordinates)),
            );
          } else if (index == 2) {
            // Navigate to the profile page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Image.asset("assets/images/Accra.png"),
      ),
    );
  }

  Widget _buildInstructions() {
    return const Text(
      "Do you need to find your way on campus? \n Enjoy your routings",
      textAlign: TextAlign.center,
      style: AppConstants.subtitleTextStyle,
    );
  }

  Widget _buildGrid(BuildContext context) {
    final List<Map<String, String>> gridItems = [
      {
        'imageName': 'assets/images/direct.png',
        'name': "Directions",
        'description': "Get directions to your destination"
      },
      {
        'imageName': 'assets/images/search.png',
        'name': "Search",
        'description': "Search for a location on campus"
      },
      {
        'imageName': 'assets/images/notification.png',
        'name': "Notification & Events",
        'description': "Get notifications on events"
      },
      {
        'imageName': 'assets/images/study.png',
        'name': "Study Space",
        'description': "Find a study space on campus"
      },
      {
        'imageName': 'assets/images/feedback.png',
        'name': "Feedback",
        'description': "Give feedback on the app"
      },
      {
        'imageName': 'assets/images/information.png',
        'name': "Information",
        'description': "Get information on campus"
      },
    ];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.builder(
          itemCount: gridItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return CustomCards(
              color: Colors.white,
              imageName: gridItems[index]['imageName']!,
              name: gridItems[index]['name']!,
              description: gridItems[index]['description']!,
              onTap: () {
                // Navigate to the respective page
                switch (index) {
                  case 0:
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const DirectionsPage()),
                    );
                    break;
                  case 1:
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const SearchPage()),
                    );
                    break;
                  case 2:
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              const NotificationAndEventPage()),
                    );
                    break;
                  case 3:
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const StudySpace()),
                    );
                    break;
                  case 4:
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              const FeedbackPage()), // Assuming FeedbackPage exists
                    );
                    break;
                  case 5:
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              const FeedbackPage()), // Assuming InformationPage exists
                    );
                    break;
                  default:
                    break;
                }
              },
            );
          },
        ),
      ),
    );
  }
}
