import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:iegy/features/home/data/models/offer_model.dart';
import 'package:iegy/features/home/data/models/product_model.dart';
import 'package:iegy/features/home/data/models/slider_model.dart';
import 'package:iegy/features/home/data/repos/home_repo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeRepoImplementation extends HomeRepo {
  var fireStore = FirebaseFirestore.instance;

  @override
  Future<Either<String, Stream<QuerySnapshot<SliderModel>>>> fetchSliders(
      BuildContext context) async {
    try {
      // Listen for realtime update
      return Right(getSlidersCollection()
          // .orderBy("date_time", descending: false)
          .snapshots());
    } catch (e) {
      return Left(
          AppLocalizations.of(context)!.somethingWentWrongPleaseTryAgainLater);
    }
  }

  CollectionReference<SliderModel> getSlidersCollection() {
    return fireStore.collection('home_sliders').withConverter<SliderModel>(
        fromFirestore: (snapshot, options) {
      return SliderModel.fromJson(snapshot.data()!);
    }, toFirestore: (slider, options) {
      return slider.toJson();
    });
  }

  CollectionReference<OfferModel> getOffersCollection() {
    return fireStore.collection('offers').withConverter<OfferModel>(
        fromFirestore: (snapshot, options) {
      return OfferModel.fromJson(snapshot.data()!);
    }, toFirestore: (offer, options) {
      return offer.toJson();
    });
  }

  CollectionReference<ProductModel> getBestSellerCollection() {
    return fireStore.collection('best_seller').withConverter<ProductModel>(
        fromFirestore: (snapshot, options) {
      return ProductModel.fromJson(snapshot.data()!);
    }, toFirestore: (product, options) {
      return product.toJson();
    });
  }

  @override
  Future<Either<String, Stream<QuerySnapshot<OfferModel>>>> fetchOffers(BuildContext context) async {
    try {
      // Listen for realtime update
      return Right(getOffersCollection()
      // .orderBy("date_time", descending: false)
          .snapshots());
    } catch (e) {
      return Left(
          AppLocalizations.of(context)!.somethingWentWrongPleaseTryAgainLater);
    }
  }

  @override
  Future<Either<String ,Stream<QuerySnapshot<ProductModel>>>> fetchBestSeller(BuildContext context) {
    try {
      // Listen for realtime updates
      Stream<QuerySnapshot<ProductModel>> bestSellerStream = getBestSellerCollection()
          .snapshots();

      // Return the successful result wrapped in a Right, inside a Future
      return Future.value(Right(bestSellerStream));
    } catch (e) {
      // Handle the error and return a Left with an error message inside a Future
      return Future.value(Left(
          AppLocalizations.of(context)!.somethingWentWrongPleaseTryAgainLater));
    }
  }
}
