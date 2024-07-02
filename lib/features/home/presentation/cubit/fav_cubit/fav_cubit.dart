import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/features/home/presentation/cubit/fav_cubit/fav_state.dart';
import 'package:iegy/features/home/presentation/screens/filter_bottom_sheet.dart';
import 'package:speech_to_text/speech_to_text.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
  bool speechEnabled = false;
  String? spokenWords = "";
  double confidenceLevel = 0;
  final SpeechToText speechToText = SpeechToText();
  FocusNode focusNode = FocusNode();

  void onVoiceSearchClicked() async {
    speechEnabled = await speechToText.initialize();
    if(speechToText.isListening) {
      _stopListening();
    } else {_startListening();}
  }

  void _stopListening () async {
    await speechToText.stop();
    emit(FavInitial());
  }

  void _startListening() async {
    await speechToText.listen(onResult: _onSpeechResult);
    confidenceLevel = 0;
    emit(SpeechEnabledState());
  }

  void _onSpeechResult(result) {
    spokenWords = "${result.recognizedWords}";
    confidenceLevel = result.cofidence;
    emit(FavInitial());
  }

  void onFilterPressed(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (_) => const FilterBottomSheet());
  }
}