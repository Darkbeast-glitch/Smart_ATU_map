import 'package:fancy_containers/fancy_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:smart_atu_nav/utils/constants.dart';
import 'package:smart_atu_nav/views/pages/Directions/faculty_page.dart';
import 'package:smart_atu_nav/views/pages/Directions/src_complex_page.dart';
import 'package:smart_atu_nav/views/pages/office_page.dart';
import 'package:smart_atu_nav/views/pages/profile_page.dart';
// import 'package:smart_atu_nav/views/pages/home_page.dart';

class DirectionsPage extends ConsumerStatefulWidget {
  const DirectionsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DirectionsPageState createState() => _DirectionsPageState();
}

class _DirectionsPageState extends ConsumerState<DirectionsPage> {
  final TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0; // Current index for BottomNavigationBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Directions",
          style: AppConstants.titleTextStyle,
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.person)))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // normal text
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Looking for direction to the major places on campus\nChoose a point of interest",
                    style: AppConstants.subtitleTextStyle,
                  ),
                ],
              ),
              const Gap(15),
              // add asearch bar

              SearchBar(
                controller: _searchController,
                hintText: "Search for a place",
                leading: const Icon(Icons.search),
                hintStyle: WidgetStateProperty.all(AppConstants.hintTextStyle),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                trailing: const [
                  Icon(Icons.mic),
                ], // Wrap the Icon in a list
              ),
              const Gap(20),
              // text that says Locations on campus

              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Locations on campus",
                      style: AppConstants.seconTitleTextStyle),
                ],
              ),
              const Gap(10),
              // cards with the major locations on campus

              // fancy container for the SRC Complex
              SingleChildScrollView(
                child: Column(
                  children: [
                    FancyContainer(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SrcComplexPage(),
                          ),
                        );
                      },
                      title: "SRC Complex",
                      subtitle: "Get all locations in the SRC Complex, ",
                      subtitleStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontFamily: "Product Sans Regular"),
                      titleStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Product Sans Regular"),
                      color1: const Color(0xFFCB1841),
                      color2: const Color(0xFF2604DE),
                      textColor: Colors.white,
                      subtitleColor: Colors.white,
                    ),
                    const Gap(10),
                    // cards with the major locations on campus

                    // fancy container for the Department
                    FancyContainer(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FacultyPage(),
                          ),
                        );
                      },
                      title: "Faculties",
                      subtitle: "Get all the departments in each faculty",
                      subtitleStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontFamily: "Product Sans Regular"),
                      titleStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Product Sans Regular"),
                      color1: const Color(0xFF2604DE),
                      color2: const Color(0xFFee2809),
                      textColor: Colors.white,
                      subtitleColor: Colors.white,
                    ),

                    const Gap(10),
                    // cards with the major locations on campus

                    // fancy container for the office

                    FancyContainer(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const OfficePage(),
                          ),
                        );
                      },
                      title: "Offices",
                      subtitle: "Get all location and rooms in the Offices",
                      subtitleStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontFamily: "Product Sans Regular"),
                      titleStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Product Sans Regular"),
                      color1: const Color(0xFFCB1841),
                      color2: const Color(0xFF2604DE),
                      textColor: Colors.white,
                      subtitleColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
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
    );
  }
}
