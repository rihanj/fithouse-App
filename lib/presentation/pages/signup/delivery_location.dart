import 'dart:async';
import 'package:fithouse_app/config/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import '../../../data/data_provider/cache_service_imp.dart';
import '../../../utils/route_generator.dart';
import '../../themes/f_h_colors.dart';
import '../../widgets/f_h_back_app_bar.dart';

class DeliveryLocation extends StatefulWidget {
  const DeliveryLocation({Key? key}) : super(key: key);

  @override
  State<DeliveryLocation> createState() => _DeliveryLocationState();
}

class _DeliveryLocationState extends State<DeliveryLocation> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.7136, 46.6753),
    zoom: 14.4746,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(24.7136, 46.6753),
        infoWindow: InfoWindow(
          title: 'Current Location',
        )
    ),
  ];

  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    CacheServiceImp().setLogin(false);
    // getUserCurrentLocation();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:FHAppWidget.appBar(context, "FitHouse"),
      body: Container(
        child: Stack(
          children: [
              Container(
                margin: const EdgeInsets.only(left: 5.0,top: 30.0,right: 5.0,bottom: 0.0)  ,
                child:Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      //enabled: false,
                      onTap: (){
                        Navigator.pushNamed(context, RouteGenerator.confirmRoute);
                      },
                      decoration: InputDecoration(
                        hintText: "Deliver to",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                  ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 5.0,top: 120.0,right: 5.0,bottom: 0.0)  ,
                  child:Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                          'Where would you like to receive your meals?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                  )
              ),
              //  google map
              Center(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 400,
                        height: 200,
                        child: GoogleMap(
                          // on below line setting camera position
                          initialCameraPosition: _kGooglePlex,
                          // on below line we are setting markers on the map
                          markers: Set<Marker>.of(_markers),
                          // on below line specifying map type.
                          mapType: MapType.normal,
                          // on below line setting user location enabled.
                          myLocationEnabled: true,
                          // on below line setting compass enabled.
                          compassEnabled: true,
                          // on below line specifying controller on map complete.
                          onMapCreated: (GoogleMapController controller){
                            _controller.complete(controller);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 200.0, // Adjust the top position as needed
                left: 12.0, // Adjust the left position as needed
                child: Row(
                children: [
                  Icon( // creating the first icon.
                    CupertinoIcons.location_solid,
                    size: 28,
                    color: Colors.black,
                  ),
                  Text(
                    'Add my delivery location',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0,top: 0.0,bottom: 0.0,right: 0.0),
                    child: Align( // here I am trying to make the third icon in the most left size of the row (in the edge of the edit profile border). but it's not working.
                      alignment: Alignment.centerLeft,
                      child: Icon(
                          Icons.arrow_forward,
                          size: 24,
                          color: FHColor.blackColor,
                      ),
                    ),
                  )
                ],
              ),
              ),
              Positioned(
                bottom: 16.0, // Adjust the bottom position as needed
                left: 16.0, // Adjust the left position as needed
                right: 16.0, // Adjust the right position as needed
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Button click logic
                    Navigator.pushNamed(context, RouteGenerator.confirmRoute);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: FHColor.appColor,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  child: Text('Allow location access'.toUpperCase()),
                ),

              ),
              Positioned(
                bottom: 60.0, // Adjust the bottom position as needed
                left: 16.0, // Adjust the left position as needed
                right: 16.0, // Adjust the right position as needed
                height: 60,
                child: Text(
                'To find your delivery address easily, tap “allow”',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),)
          ],
        ),
      ),

      // on pressing floating action button the camera will take to user current location
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async{
      //     getUserCurrentLocation().then((value) async {
      //       print(value.latitude.toString() +" "+value.longitude.toString());
      //
      //       // marker added for current users location
      //       _markers.add(
      //           Marker(
      //             markerId: MarkerId("2"),
      //             position: LatLng(value.latitude, value.longitude),
      //             infoWindow: InfoWindow(
      //               title: 'My Current Location',
      //             ),
      //           )
      //       );
      //
      //       // specified current users location
      //       CameraPosition cameraPosition = new CameraPosition(
      //         target: LatLng(value.latitude, value.longitude),
      //         zoom: 14,
      //       );
      //
      //       final GoogleMapController controller = await _controller.future;
      //       controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      //       setState(() {
      //       });
      //     });
      //   },
      //   child: Icon(Icons.local_activity),
      // ),
    );
  }
}
