import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:iegy/features/home/data/models/slider_model.dart';

abstract class HomeRepo {
  Future<Either<String ,Stream<QuerySnapshot<SliderModel>>>> fetchSliders(BuildContext context);
}
