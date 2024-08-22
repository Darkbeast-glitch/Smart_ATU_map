import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_atu_nav/providers/bottom_navigation_state.dart';
import 'package:smart_atu_nav/providers/map_controller_provider.dart';
import 'package:smart_atu_nav/utils/constants.dart';
import 'package:smart_atu_nav/views/pages/home_page.dart';
import 'package:smart_atu_nav/views/pages/profile_page.dart';

class MapPage extends ConsumerStatefulWidget {
  final LatLng initialCoordinates;
  final LatLng? destinationCoordinates;

  MapPage({
    super.key,
    required this.initialCoordinates,
    this.destinationCoordinates,
  });

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polylines = {};
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    if (widget.destinationCoordinates != null) {
      getPolyPoints();
    }
    markers.add(
      Marker(
        markerId: const MarkerId('Source'),
        position: widget.initialCoordinates,
        infoWindow: const InfoWindow(
          title: 'Starting Location',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    );
    if (widget.destinationCoordinates != null) {
      markers.add(
        Marker(
          markerId: const MarkerId('Destination'),
          position: widget.destinationCoordinates!,
          infoWindow: const InfoWindow(
            title: 'Destination',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    }
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: AppConstants.google_api_key,
      request: PolylineRequest(
        origin: PointLatLng(widget.initialCoordinates.latitude,
            widget.initialCoordinates.longitude),
        destination: PointLatLng(widget.destinationCoordinates!.latitude,
            widget.destinationCoordinates!.longitude),
        mode: TravelMode.driving,
      ),
    );
    if (result.points.isNotEmpty) {
      setState(() {
        polylineCoordinates = result.points
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList();

        polylines.add(
          Polyline(
            polylineId: PolylineId("route"),
            points: polylineCoordinates,
            color: Colors.blue,
            width: 6,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mapController = ref.watch(mapControllerProvider);
    final currentIndex = ref.watch(currentPageIndexProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Quick Map',
          style: AppConstants.titleTextStyle.copyWith(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          ref.read(mapControllerProvider.notifier).state = controller;
        },
        initialCameraPosition: CameraPosition(
          target: widget.initialCoordinates,
          zoom: 13.0,
        ),
        markers: markers,
        polylines: polylines,
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets. 0ball(20),
          child: FloatingActionButton(
            onPressed: () async {
              Position position = await currentPosition();
              LatLng newPosition =
                  LatLng(position.latitude, position.longitude);

              // Animate the camera to the new position
              mapController?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: newPosition,
                    zoom: 16.0,
                  ),
                ),
              );

              // Add the new marker for current location
              setState(() {
                markers.add(
                  Marker(
                    markerId: const MarkerId("Current Location"),
                    position: newPosition,
                    infoWindow: const InfoWindow(
                      title: 'Current Location',
                    ),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueGreen),
                  ),
                );
              });

              // Update the map with the new marker
              ref.read(mapControllerProvider.notifier).state = mapController;
            },
            child: const Icon(Icons.my_location),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(currentPageIndexProvider.notifier).state = index;
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 2) {
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

  Future<Position> currentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permanently denied");
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
