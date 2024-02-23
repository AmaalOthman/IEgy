import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/core/bloc/cubit/global_state.dart';
import 'package:iegy/core/database/cache/cache_helper.dart';
import 'package:iegy/core/services/service_locator.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  String langCode = 'ar';

  void switchLanguage() async {
    emit(changeLanguageLoading());
    if(sl<CacheHelper>().getCachedLanguage() == 'ar') {
      langCode = 'en';
      await sl<CacheHelper>().cacheLanguage('en');
    } else {langCode = 'ar';
    await sl<CacheHelper>().cacheLanguage('ar');
    }
    emit(changeLanguageSuccess());
  }

  void getCachedLang() {
    emit(changeLanguageLoading());
    final cachedLang = sl<CacheHelper>().getCachedLanguage();
    langCode = cachedLang;
    emit(changeLanguageSuccess());
  }
}