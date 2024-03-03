import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/core/database/cache/cache_helper.dart';
import 'package:iegy/core/services/service_locator.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.categories, style: Theme.of(context).textTheme.displayLarge,),
        leading: Icon(sl<CacheHelper>().getCachedLanguage() == 'ar'? CupertinoIcons.arrow_turn_up_right: CupertinoIcons.arrow_turn_up_left),
      )
    );
  }
}
