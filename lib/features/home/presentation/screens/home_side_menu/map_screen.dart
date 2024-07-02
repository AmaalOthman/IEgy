import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/utils/app_text_style.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_text_form_field.dart';
import 'package:iegy/features/home/presentation/cubit/map_cubit/map_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/map_cubit/map_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.latLng});
  final LatLng latLng;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late BitmapDescriptor branchLocation;
  late BitmapDescriptor userLocation;

  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(34.w, 34.h)), AppAssets.locationOnMap)
        .then((onValue) {
      branchLocation = onValue;
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(34.w, 34.h)), AppAssets.userLocation)
        .then((onValue) {
      userLocation = onValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final LatLng userPosition = ModalRoute.of(context)!.settings.arguments as LatLng;
    Set<Marker> markers = {
      Marker(
          markerId: const MarkerId('user_location'),
          position: widget.latLng, icon: userLocation),
      Marker(
          markerId: const MarkerId('branch_location'),
          position: const LatLng(30.152102, 31.335730), icon: branchLocation)
    };
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: AppColors.white, // Status bar color
      statusBarIconBrightness:
          Brightness.dark, // Status bar icons color (like clock and battery)
    ));
    return SafeArea(
        child: BlocBuilder<MapCubit, MapState>(builder: (context, state) {
      return Scaffold(
          body: Stack(children: [
            GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition:
                    BlocProvider.of<MapCubit>(context).gesrAlSwaisPosition,
                onMapCreated: (GoogleMapController controller) {
                  BlocProvider.of<MapCubit>(context)
                      .controller
                      .complete(controller);
                },
                markers: markers),
            Positioned(
                top: 24.h,
                child: Row(children: [
                  const BackArrow(),
                  CustomTextFormField(
                      h: 48.h,
                      w: 350.w,
                      controller: TextEditingController(
                          text: BlocProvider.of<MapCubit>(context)
                                  .speechToText
                                  .isListening
                              ? "listening.."
                              : BlocProvider.of<MapCubit>(context).spokenWords),
                      focusNode: BlocProvider.of<MapCubit>(context).focusNode,
                      shadow: true,
                      preIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomImage(
                                imagePath: AppAssets.googleLocation,
                                h: 24.h,
                                w: 24.w)
                          ]),
                      suffixIcon: CustomImage(
                        imagePath: AppAssets.mic,
                        h: 18.h,
                        w: 13.39.w,
                      ),
                      onSuffixPressed: BlocProvider.of<MapCubit>(context)
                          .onVoiceSearchClicked,
                      hint:
                          AppLocalizations.of(context)!.what_are_u_looking_for)
                ]))
          ]),
          bottomNavigationBar: SizedBox(
              height: 87.h,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: BottomNavigationBar(
                      // currentIndex: BlocProvider.of<NavBarCubit>(context).currentIndex,
                      onTap: (index) {
                        /*BlocProvider.of<NavBarCubit>(context).changeIndex(index);
                  BlocProvider.of<NavBarCubit>(context).controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );*/
                      },
                      selectedLabelStyle: mediumStyle(
                          fontSize: 16.h, color: AppColors.lightBrown),
                      unselectedLabelStyle: mediumStyle(
                          fontSize: 16.h, color: AppColors.lightBrown),
                      unselectedItemColor: AppColors.lightBrown,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.location_on,
                                color: AppColors.lightBrown, size: 28.h),
                            label: AppLocalizations.of(context)!.explore),
                        BottomNavigationBarItem(
                            icon: CustomImage(
                                imagePath: AppAssets.car, h: 20.h, w: 22.5.w),
                            label: AppLocalizations.of(context)!.by_car),
                        BottomNavigationBarItem(
                            icon: CustomImage(
                                imagePath: AppAssets.bike, h: 23.75.h, w: 25.w),
                            label: AppLocalizations.of(context)!.by_bike),
                        BottomNavigationBarItem(
                            icon: CustomImage(
                                imagePath: AppAssets.walking,
                                h: 27.25.h,
                                w: 16.25.w),
                            label: AppLocalizations.of(context)!.on_foot)
                      ]))));
    }));
  }

  Location location = Location();

  LocationData? locationData;

  void getPermission() async {
    var isLocationServiceEnabled = await isServiceEnabled();
    if (!isLocationServiceEnabled) return;
    var isPermissionEnabled = await isPermissionGranted();
    if (!isPermissionEnabled) return;
    locationData = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      locationData = currentLocation;
      // log(_locationData?.latitude.toString() ?? '', name: 'دائرة العرض:');
      // log(_locationData?.longitude.toString() ?? '', name: 'خط الطول:');
    });
  }

//get location opened
  Future<bool> isServiceEnabled() async {
    bool serviceEnabled;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    return serviceEnabled;
  }

//get permission to use location
  Future<bool> isPermissionGranted() async {
    PermissionStatus permissionGranted;
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }
    return permissionGranted == PermissionStatus.granted;
  }
}

/*import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.152102, 31.335730),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  var defLat = 30.227911;
  var defLong = 31.2891996;

  late Set<Marker> markers;

  @override
  void initState() {
    super.initState();
    getPermission();
    markers = {
      Marker(
          markerId: MarkerId('user_location'),
          position: LatLng(_locationData?.latitude ?? defLat,
              _locationData?.longitude ?? defLong))
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: markers,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: const Text('To the lake!'),
          icon: const Icon(Icons.directions_boat),
        ));
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Location location = new Location();

  LocationData? _locationData;

  void getPermission() async {
    var isLocationServiceEnabled = await isServiceEnabled();
    if (!isLocationServiceEnabled) return;

    var isPermissionEnabled = await isPermissionGranted();
    if (!isPermissionEnabled) return;

    _locationData = await location.getLocation();

    */ /*location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
      _locationData = currentLocation;
      log(_locationData?.latitude.toString() ?? '', name: 'دائرة العرض');
      log(_locationData?.longitude.toString() ?? '', name: 'خط الطول');
    });*/ /*
  }

  //Get Location Open
  Future<bool> isServiceEnabled() async {
    bool _serviceEnabled;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    return _serviceEnabled;
  }

  //Get Permission To Use Location
  Future<bool> isPermissionGranted() async {
    PermissionStatus _permissionGranted;
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    return _permissionGranted == PermissionStatus.granted;
  }
}*/
