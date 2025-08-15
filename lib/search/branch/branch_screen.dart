import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibank/core/ui/components/basic_scaffold.dart';
import 'package:ibank/core/ui/design_system/ibank_input.dart';

class BranchScreen extends StatelessWidget {
  const BranchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    final LatLng center = const LatLng(-33.86, 151.20);
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
        child: Stack(
          children: [
            FutureBuilder(
              future: futures,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (snapshot.hasData) {
                  return GoogleMap(
                    style: snapshot.data[0],
                    initialCameraPosition: CameraPosition(
                      target: center,
                      zoom: 11,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId('marker'),
                        position: center,
                        icon: snapshot.data[1],
                      ),
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            DraggableScrollableSheet(
              maxChildSize: 0.7,
              initialChildSize: 0.5,
              builder: (context, scrollController) => Container(
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8,
                      children: [
                        Container(
                          decoration: BoxDecoration(color: colorScheme.outline),
                          height: 4,
                          width: 32,
                          margin: const EdgeInsets.only(bottom: 12.0),
                        ),
                        IBankInput(
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                'assets/icons/search.svg',
                              ),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: search.length,
                          itemBuilder: (context, index) => ListTile(
                            leading: Image.asset(
                              'assets/images/map_marker.png',
                            ),
                            title: Text(
                              search[index],
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Text(
                              '5m',
                              style: textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.outline.withAlpha(160),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> search = [
  'Bank 1656 Union Street',
  'Bank Secaucus',
  'Bank 1657 Riverside Drive',
  'Bank Rutherford',
  'Bank 1656 Union Street',
];
