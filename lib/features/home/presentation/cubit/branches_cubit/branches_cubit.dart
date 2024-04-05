import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/core/routes/app_routes.dart';
import 'package:iegy/core/utils/common_methods.dart';
import 'package:iegy/features/home/presentation/cubit/branches_cubit/branches_state.dart';
import 'package:location/location.dart';

class BranchesCubit extends Cubit<BranchesState> {
  BranchesCubit() : super(BranchesInitial());

  Location location = Location();
  LocationData? _locationData;

  void getPermission() async {
    var isLocationServiceEnabled = await isServiceEnabled();
    if(!isLocationServiceEnabled) return;
    var isPermissionEnabled = await isPermissionGranted();
    if(!isPermissionEnabled) return;
    _locationData = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      _locationData = currentLocation;
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

  void openLocation(BuildContext context) {
    getPermission();
    navigate(context: context, route: Routes.mapScreen);
  }
}
