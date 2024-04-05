import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iegy/features/home/presentation/cubit/map_cubit/map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());
  final Completer<GoogleMapController> controller =
  Completer<GoogleMapController>();

  CameraPosition gesrAlSwaisPosition = const CameraPosition(
    target: LatLng(30.152102, 31.335730),
    zoom: 14.4746,
  );
}
