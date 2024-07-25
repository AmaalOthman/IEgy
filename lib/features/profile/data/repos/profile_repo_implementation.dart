import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iegy/features/profile/data/repos/profile_repo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileRepoImplementation extends ProfileRepo {

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<String> logout(BuildContext context) async {
    try {
      await auth.signOut();
      /*await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();*/
      return AppLocalizations.of(context)!.successLogOut;
    } on FirebaseAuthException catch (e) {
      return AppLocalizations.of(context)!.errorLogingoutTryAgainLater;
    } catch (e) {
      return AppLocalizations.of(context)!.errorLogingoutTryAgainLater;
    }
  }
}