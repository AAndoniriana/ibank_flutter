import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibank/core/ui/components/basic_scaffold.dart';
import 'package:ibank/core/ui/design_system/ibank_input.dart';

class BranchScreen extends StatefulWidget {
  const BranchScreen({super.key});

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen>
    with TickerProviderStateMixin {
  final LatLng _center = const LatLng(-33.86, 151.20);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;
    final Future<dynamic> futures = Future.wait([
      rootBundle.loadString('assets/resources/style.json'),
      BitmapDescriptor.asset(
        const ImageConfiguration(),
        'assets/images/map_marker.png',
      ),
    ]);

    return BasicScaffold(
      title: 'Branch',
      body: SafeArea(
        child: FutureBuilder(
          future: futures,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData) {
              return GoogleMap(
                style: snapshot.data[0],
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('marker'),
                    position: _center,
                    icon: snapshot.data[1],
                  ),
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        dragHandleColor: colorScheme.outline,
        animationController: BottomSheet.createAnimationController(this),
        enableDrag: true,
        showDragHandle: true,
        backgroundColor: colorScheme.surface,
        builder: (context) => SizedBox(
          height: screenSize.height * 0.5,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              spacing: 8,
              children: [
                IBankInput(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset('assets/icons/search.svg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
