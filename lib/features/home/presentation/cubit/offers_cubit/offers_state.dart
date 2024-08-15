import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iegy/features/home/data/models/offer_model.dart';

sealed class OffersState {}

final class OffersInitial extends OffersState {}
final class OffersLoadingState extends OffersState {}
final class OffersSuccessState extends OffersState {
  final Stream<QuerySnapshot<OfferModel>> offers;
  OffersSuccessState(this.offers);
}
final class OffersErrorState extends OffersState {
  final String errorMessage;
  OffersErrorState(this.errorMessage);
}
