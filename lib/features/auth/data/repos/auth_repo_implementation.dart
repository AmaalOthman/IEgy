/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iegy/features/auth/data/models/sign_up_request_body.dart';
import 'package:iegy/features/auth/data/models/user_model.dart';
import 'package:iegy/features/auth/data/repos/auth_repo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthRepositoryImplementation extends AuthRepo {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<Either<String, UserModel>> signUpWithEmailAndPassword(
      SignUpRequestBody signUpRequestBody, BuildContext context) async {
  try {
  var credentials = await auth.createUserWithEmailAndPassword(
  email: signUpRequestBody.email, password: signUpRequestBody.password);
  UserModel newUser = UserModel(
  id: credentials.user?.uid,
  name: credentials.user?.displayName ?? signUpRequestBody.name,
  email: credentials.user?.email, image: credentials.user?.photoURL, pushToken: null, phone: credentials.user?.phoneNumber?? signUpRequestBody.phoneNumber, address: null);
  var insertedUser = await insertUser(newUser);
  return Right(newUser);
  } on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
  return Left(AppLocalizations.of(context)!.weekPassword);
  } else if (e.code == 'email-already-in-use') {
    return Left(AppLocalizations.of(context)!.thisEmailIsAlreadyRegistered);
  }
  } catch (e) {
    return Left(AppLocalizations.of(context)!.somethingWentWrongPleaseTryAgainLater);
  }}

  static Future<UserModel?> insertUser(UserModel user) async {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.id);
    var res = await docRef.set(user);
    return user;
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
        fromFirestore: (doc, _) => UserModel.fromJson(doc.data()!),
        toFirestore: (user, options) => user.toJson());
  }
}
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iegy/features/auth/data/models/sign_up_request_body.dart';
import 'package:iegy/features/auth/data/models/user_model.dart';
import 'package:iegy/features/auth/data/repos/auth_repo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthRepositoryImplementation extends AuthRepo {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<Either<String, UserModel>> signUpWithEmailAndPassword(
      SignUpRequestBody signUpRequestBody, BuildContext context) async {
    try {
      var credentials = await auth.createUserWithEmailAndPassword(
          email: signUpRequestBody.email, password: signUpRequestBody.password);
      UserModel newUser = UserModel(
        id: credentials.user?.uid,
        name: credentials.user?.displayName ?? signUpRequestBody.name,
        email: credentials.user?.email,
        image: credentials.user?.photoURL,
        pushToken: null,
        phone: credentials.user?.phoneNumber ?? signUpRequestBody.phoneNumber,
        address: null,
      );
      var insertedUser = await insertUser(newUser);
      return Right(newUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(AppLocalizations.of(context)!.weekPassword);
      } else if (e.code == 'email-already-in-use') {
        return Left(AppLocalizations.of(context)!.thisEmailIsAlreadyRegistered);
      } else {
        return Left(AppLocalizations.of(context)!.somethingWentWrongPleaseTryAgainLater);
      }
    } catch (e) {
      return Left(AppLocalizations.of(context)!.somethingWentWrongPleaseTryAgainLater);
    }
  }

  static Future<UserModel?> insertUser(UserModel user) async {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.id);
    await docRef.set(user);
    return user;
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
      fromFirestore: (doc, _) => UserModel.fromJson(doc.data()!),
      toFirestore: (user, options) => user.toJson(),
    );
  }
}
