import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VillageMapScreen extends StatelessWidget {
  const VillageMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LatLng villageLocation = const LatLng(23.0225, 72.5714); // replace with your coordinates

    return Scaffold(
      appBar: AppBar(
        title: const Text("Village Map"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: villageLocation,
          zoom: 15,
        ),
        markers: {
          Marker(markerId: const MarkerId('village'), position: villageLocation),
        },
      ),
    );
  }
}