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

  /// `Gaza`
  String get gaza {
    return Intl.message(
      'Gaza',
      name: 'gaza',
      desc: '',
      args: [],
    );
  }

  /// `Follow the events of the war in Gaza and the effects of the brutal occupation on civilians`
  String get gaza_d {
    return Intl.message(
      'Follow the events of the war in Gaza and the effects of the brutal occupation on civilians',
      name: 'gaza_d',
      desc: '',
      args: [],
    );
  }

  /// `Hollywood`
  String get hollywood {
    return Intl.message(
      'Hollywood',
      name: 'hollywood',
      desc: '',
      args: [],
    );
  }

  /// `Follow the most important events within the American artistic community`
  String get hollywood_d {
    return Intl.message(
      'Follow the most important events within the American artistic community',
      name: 'hollywood_d',
      desc: '',
      args: [],
    );
  }

  /// `Premier League`
  String get premier_league {
    return Intl.message(
      'Premier League',
      name: 'premier_league',
      desc: '',
      args: [],
    );
  }

  /// `The events of the English Premier League have become interesting. Take a look`
  String get premierleague_d {
    return Intl.message(
      'The events of the English Premier League have become interesting. Take a look',
      name: 'premierleague_d',
      desc: '',
      args: [],
    );
  }

  /// `More details`
  String get more {
    return Intl.message(
      'More details',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Popular Organization`
  String get popular_orgs {
    return Intl.message(
      'Popular Organization',
      name: 'popular_orgs',
      desc: '',
      args: [],
    );
  }

  /// `Trends`
  String get trends {
    return Intl.message(
      'Trends',
      name: 'trends',
      desc: '',
      args: [],
    );
  }

  /// `Feed`
  String get feed {
    return Intl.message(
      'Feed',
      name: 'feed',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get category {
    return Intl.message(
      'Categories',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message(
      'Appearance',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get dark {
    return Intl.message(
      'Dark mode',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get lang {
    return Intl.message(
      'Language',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get ar {
    return Intl.message(
      'Arabic',
      name: 'ar',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
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

  /// `Welcome back! explore news.`
  String get login_msg {
    return Intl.message(
      'Welcome back! explore news.',
      name: 'login_msg',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get pass {
    return Intl.message(
      'Password',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get google {
    return Intl.message(
      'Sign in with Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get havent_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'havent_account',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Browse what's going on around the world.`
  String get register_msg {
    return Intl.message(
      'Browse what\'s going on around the world.',
      name: 'register_msg',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_pass {
    return Intl.message(
      'Confirm password',
      name: 'confirm_pass',
      desc: '',
      args: [],
    );
  }

  /// `Create asccount`
  String get create_account {
    return Intl.message(
      'Create asccount',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Latest`
  String get latest {
    return Intl.message(
      'Latest',
      name: 'latest',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get sports {
    return Intl.message(
      'Sports',
      name: 'sports',
      desc: '',
      args: [],
    );
  }

  /// `Browse sports news and championships`
  String get sports_d {
    return Intl.message(
      'Browse sports news and championships',
      name: 'sports_d',
      desc: '',
      args: [],
    );
  }

  /// `Science`
  String get science {
    return Intl.message(
      'Science',
      name: 'science',
      desc: '',
      args: [],
    );
  }

  /// `Latest research results and developments in various scientific fields`
  String get science_d {
    return Intl.message(
      'Latest research results and developments in various scientific fields',
      name: 'science_d',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get business {
    return Intl.message(
      'Business',
      name: 'business',
      desc: '',
      args: [],
    );
  }

  /// `Get to know the latest events in the global market`
  String get business_d {
    return Intl.message(
      'Get to know the latest events in the global market',
      name: 'business_d',
      desc: '',
      args: [],
    );
  }

  /// `Technology`
  String get technology {
    return Intl.message(
      'Technology',
      name: 'technology',
      desc: '',
      args: [],
    );
  }

  /// `Technology is achieving great progress and accomplishments in the world`
  String get technology_d {
    return Intl.message(
      'Technology is achieving great progress and accomplishments in the world',
      name: 'technology_d',
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
