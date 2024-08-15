import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
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
}
