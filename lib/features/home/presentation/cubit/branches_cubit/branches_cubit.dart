import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iegy/features/home/presentation/cubit/branches_cubit/branches_state.dart';
import 'package:iegy/features/home/presentation/screens/home_side_menu/map_screen.dart';
import 'package:location/location.dart';

class BranchesCubit extends Cubit<BranchesState> {
  BranchesCubit() : super(BranchesInitial());

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
      log(locationData?.latitude.toString() ?? '', name: 'دائرة العرض:');
      log(locationData?.longitude.toString() ?? '', name: 'خط الطول:');
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

  void openLocation(BuildContext context) {
    getPermission();
    // navigate(context: context, route: Routes.mapScreen, arg: LatLng((locationData?.latitude) ?? 1, (locationData?.longitude)?? 1));
    Navigator.push(context, MaterialPageRoute(builder: (_) => MapScreen(latLng: LatLng((locationData?.latitude)?? 30.152102, (locationData?.longitude)?? 31.335730))));
  }
}
