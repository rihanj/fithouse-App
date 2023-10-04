import 'package:fithouse_app/config/size_config.dart';
import 'package:fithouse_app/presentation/themes/f_h_colors.dart';
import 'package:fithouse_app/utils/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../model/place_model/place_model.dart';
import '../../repository/repo.dart';
import 'package:permission_handler/permission_handler.dart';

Color color = const Color(0xfffe8903);

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  BitmapDescriptor? currentLocation;
  TextEditingController placeController = TextEditingController();

  late final GoogleMapController _controller;
  Position? _currentPosition;
  LatLng _currentLatLng = const LatLng(24.7136, 46.6753);

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  getLocation() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      // Permission granted, proceed with location access
      var pp = await Geolocator.checkPermission();
      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _currentLatLng = LatLng(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );
      setState(() {});
    } else if (status.isDenied) {
      // Permission denied by user
      // You can show a dialog or snackbar to inform the user
      _currentLatLng = LatLng(24.7136, 46.6753);
      setState(() {});
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied by user
      // You can show a dialog or snackbar to inform the user and provide instructions on how to enable the permission manually in device settings
      _currentLatLng = LatLng(24.7136, 46.6753);
      setState(() {});
    }

  }

  Widget autoComplete() {
    return Container(
      // height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                blurRadius: 8.0,
                spreadRadius: 1,
                offset: const Offset(0, 4))
          ],
          borderRadius: BorderRadius.circular(12)),
      child: TypeAheadFormField<Description?>(
        onSuggestionSelected: (suggestion) {
          setState(() {
            placeController.text =
                suggestion?.structured_formatting?.main_text ?? "";
          });
        },
        getImmediateSuggestions: true,
        keepSuggestionsOnLoading: true,
        textFieldConfiguration: TextFieldConfiguration(
            style: GoogleFonts.lato(),
            controller: placeController,
            // style: GoogleFonts.poppins(),
            decoration: InputDecoration(
              isDense: false,
              fillColor: Colors.transparent,
              filled: false,
              prefixIcon: Icon(CupertinoIcons.search, color:FHColor.appColor),
              suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      placeController.clear();
                    });
                  },
                  child: const Icon(Icons.clear, color: FHColor.appColor)),
              // contentPadding:
              //     const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              hintText: "Search location",
              hintStyle: GoogleFonts.lato(),

              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            )),
        itemBuilder: (context, Description? itemData) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 18,
                  color: Colors.grey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${itemData?.structured_formatting?.main_text}",
                      style: const TextStyle(color: Colors.green),
                    ),
                    Text("${itemData?.structured_formatting?.secondary_text}"),
                    const Divider()
                  ],
                ),
              ],
            ),
          );
        },
        noItemsFoundBuilder: (context) {
          return Container();
          // return Wrap(
          //   children: const [
          //     Center(
          //         heightFactor: 2,
          //         child: Text(
          //           "Location Not Found!!",
          //           style: TextStyle(
          //             fontSize: 12,
          //           ),
          //         )),
          //   ],
          // );
        },
        suggestionsCallback: (String pattern) async {
          var predictionModel =
          await Repo.placeAutoComplete(placeInput: pattern);

          if (predictionModel != null) {
            return predictionModel.predictions!.where((element) => element
                .description!
                .toLowerCase()
                .contains(pattern.toLowerCase()));
          } else {
            return [];
          }
        },
      ),
    );
  }

  Widget locationsWidget() {
    return Container(
      margin: EdgeInsets.zero,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              spreadRadius: 1,
              offset: Offset(0, 4))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration:
                  BoxDecoration(color: FHColor.appColor, shape: BoxShape.circle),
                ),
                const SizedBox(
                  width: 8,
                ),
                Wrap(
                  direction: Axis.vertical,
                  children: const [
                    Text(
                      "Current Location",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Vipul Trade Center",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Divider(
                height: 8,
                color: color.withOpacity(0.6),
              ),
            ),
            // Row(
            //   children: [
            //     Container(
            //       height: 15,
            //       width: 15,
            //       decoration: BoxDecoration(
            //           border: Border.all(color: color, width: 4),
            //           shape: BoxShape.circle),
            //     ),
            //     const SizedBox(
            //       width: 8,
            //     ),
            //     Wrap(
            //       direction: Axis.vertical,
            //       children: [
            //         const Text(
            //           "Destination",
            //           style: TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         SizedBox(
            //           width: 300,
            //           child: Text(
            //             placeController.text.isEmpty
            //                 ? "Select Destination"
            //                 : placeController.text,
            //             overflow: TextOverflow.visible,
            //             style: const TextStyle(
            //               fontSize: 16,
            //               color: Colors.grey,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: _currentPosition == null
            ? const Center(child: CircularProgressIndicator()
          //CircularProgressIndicator(),
        )
            : Stack(
          children: [
            GoogleMap(
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition:
              CameraPosition(zoom: 16, target: _currentLatLng),
              onMapCreated: (controller) async {
                setState(() {
                  _controller = controller;
                });
                String val = "json/google_map_dark_light.json";
                var c = await rootBundle.loadString(val);
                _controller.setMapStyle(c);
              },
              markers: {
                Marker(
                    markerId: const MarkerId("1"),
                    // icon: currentLocation!,
                    position: _currentLatLng)
              },
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    autoComplete(),
                    const SizedBox(
                      height: 600,
                    ),
                    locationsWidget(),
                    const Spacer(),
                    confirmButton(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget confirmButton() {
    return Container(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0,top: 0.0,right: 0.0,bottom: 8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: FHColor.appColor,
                minimumSize: const Size(double.infinity, 50)),
            onPressed: () {
              // _controller.animateCamera(CameraUpdate.newCameraPosition(
              //     const CameraPosition(target: LatLng(0, 0))));

              Navigator.pushNamed(context, RouteGenerator.fitnessRoute);

            },
            child: Text(
              "CONFIRM PIN LOCATION",
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}