import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iegy/features/home/data/models/product_model.dart';

sealed class BestSellerState {}

final class BestSellerInitial extends BestSellerState {}
final class BestSellerLoadingState extends BestSellerState {}
final class BestSellerSuccessState extends BestSellerState {
  final Stream<QuerySnapshot<ProductModel>> bestSeller;

  BestSellerSuccessState(this.bestSeller);
}
final class BestSellerErrorState extends BestSellerState {
  final String errorMessage;

  BestSellerErrorState(this.errorMessage);
}