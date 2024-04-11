import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class good_goodsMap extends StatefulWidget {

  good_goodsMap({
    Key? key,
  }) : super(key: key);

  @override
  State<good_goodsMap> createState() => _good_goodsMapState();
}

class _good_goodsMapState extends State<good_goodsMap> {
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kLake = CameraPosition(
    target: LatLng(28.209620, 83.985523),
    zoom: 14,
  );

  dynamic finalvalue = "";

  List<Marker> markers = [];
  List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(28.209620, 83.985523),
        infoWindow: InfoWindow(title: "My position")),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(28.209628, 83.985529),
        infoWindow: InfoWindow(title: "Another position"))
  ];

  int id = 1;
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              onTap: (LatLng latlang) async {
                setState(() {
                  markers.clear();
                });
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: markers.toSet(),
              polylines: _polylines,
              initialCameraPosition: _kLake,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
            ),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 35,
                )),
            if (markers.isNotEmpty)
              Positioned(
                bottom: 16,
                left: 20,
                right: 70,
                child: InkWell(
                  onTap: () {
                    final marker = markers.first;
                    print(marker.infoWindow.title);
                   
                    Navigator.pop(context);
                  },
                 
                ),
              ),
          ],
        ),
      ),
    );
  }
}
