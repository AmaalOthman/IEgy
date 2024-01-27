// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `We create furniture with your eyes!!`
  String get we_create_furniture_with_your_eyes {
    return Intl.message(
      'We create furniture with your eyes!!',
      name: 'we_create_furniture_with_your_eyes',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `New home!! New furniture!!`
  String get new_home_new_furniture {
    return Intl.message(
      'New home!! New furniture!!',
      name: 'new_home_new_furniture',
      desc: '',
      args: [],
    );
  }

  /// `Discover our distinctive collection of furniture and renew your home with a magical touch.`
  String
      get discover_our_distinctive_collection_of_furniture_and_renew_your_home_with_a_magical_touch {
    return Intl.message(
      'Discover our distinctive collection of furniture and renew your home with a magical touch.',
      name:
          'discover_our_distinctive_collection_of_furniture_and_renew_your_home_with_a_magical_touch',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Login with`
  String get login_with {
    return Intl.message(
      'Login with',
      name: 'login_with',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message(
      'Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Create new account`
  String get create_new_acc {
    return Intl.message(
      'Create new account',
      name: 'create_new_acc',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get password_is_required {
    return Intl.message(
      'Password is required',
      name: 'password_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email`
  String get please_enter_valid_email {
    return Intl.message(
      'Please enter valid email',
      name: 'please_enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get email_is_required {
    return Intl.message(
      'Email is required',
      name: 'email_is_required',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}