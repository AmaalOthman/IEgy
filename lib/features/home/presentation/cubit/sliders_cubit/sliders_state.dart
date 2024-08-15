import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iegy/features/home/data/models/slider_model.dart';

sealed class SlidersState {}

final class SlidersInitial extends SlidersState {}
final class SlidersLoadingState extends SlidersState {}
final class SlidersSuccessState extends SlidersState {
  final Stream<QuerySnapshot<SliderModel>> sliders;

  SlidersSuccessState(this.sliders);
}
final class SlidersErrorState extends SlidersState {
  final String errorMessage;

  SlidersErrorState(this.errorMessage);
}
