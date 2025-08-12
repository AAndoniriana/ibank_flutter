import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibank/core/ui/components/basic_scaffold.dart';

class BranchScreen extends StatelessWidget {
  const BranchScreen({super.key});

  final LatLng _center = const LatLng(-33.86, 151.20);

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: rootBundle.loadString('assets/resources/style.json'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData) {
              return GoogleMap(
                style: snapshot.data,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('marker'),
                    position: _center,
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet,
                    ),
                  ),
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      title: 'Branch',
    );
  }
}
