import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iegy/features/home/presentation/cubit/map_cubit/map_state.dart';
import 'package:speech_to_text/speech_to_text.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  CameraPosition gesrAlSwaisPosition =
      const CameraPosition(target: LatLng(30.152102, 31.335730), zoom: 14.4746);
  final SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String? spokenWords = "";
  double confidenceLevel = 0;
  FocusNode focusNode = FocusNode();

  void onVoiceSearchClicked() async {
    speechEnabled = await speechToText.initialize();
    if (speechToText.isListening) {
      _stopListening();
    } else {
      _startListening();
    }
  }

  void _stopListening() async {
    await speechToText.stop();
    emit(MapInitial());
  }

  void _startListening() async {
    await speechToText.listen(onResult: _onSpeechResult);
    confidenceLevel = 0;
    emit(SpeechEnabledState());
  }

  void _onSpeechResult(result) {
    spokenWords = "${result.recognizedWords}";
    confidenceLevel = result.cofidence;
    emit(MapInitial());
  }
}
