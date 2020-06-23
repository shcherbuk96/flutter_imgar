import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_brace_in_string_interps

//WARNING: This file is automatically generated. DO NOT EDIT, all your changes would be lost.

typedef LocaleChangeCallback = void Function(Locale locale);

class I18n implements WidgetsLocalizations {
  const I18n();
  static Locale _locale;
  static bool _shouldReload = false;

  static set locale(Locale newLocale) {
    _shouldReload = true;
    I18n._locale = newLocale;
  }

  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  /// function to be invoked when changing the language
  static LocaleChangeCallback onLocaleChanged;

  static I18n of(BuildContext context) =>
    Localizations.of<I18n>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  /// "Main Page"
  String get titlesMainScreen => "Main Page";
  /// "Films"
  String get titlesListScreen => "Films";
  /// "Details"
  String get titlesFilmScreen => "Details";
  /// "Enter the movie"
  String get search_list_screenHintSearchFiled => "Enter the movie";
  /// "Back"
  String get bottom_navigation_film_screenBackBottomNavBarItem => "Back";
  /// "Save"
  String get bottom_navigation_film_screenSaveBottomNavBarItem => "Save";
  /// "Saving..."
  String get toast_film_screenImageIsSaving => "Saving...";
  /// "Image is saved"
  String get toast_film_screenImageIsSaved => "Image is saved";
  /// "This movie hasn't trailer"
  String get toast_film_screenHasNotTrailer => "This movie hasn't trailer";
}

class _I18n_en_US extends I18n {
  const _I18n_en_US();

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_ru_RU extends I18n {
  const _I18n_ru_RU();

  /// "Главная страница"
  @override
  String get titlesMainScreen => "Главная страница";
  /// "Фильмы"
  @override
  String get titlesListScreen => "Фильмы";
  /// "Описание"
  @override
  String get titlesFilmScreen => "Описание";
  /// "Введите фильм"
  @override
  String get search_list_screenHintSearchFiled => "Введите фильм";
  /// "Назад"
  @override
  String get bottom_navigation_film_screenBackBottomNavBarItem => "Назад";
  /// "Сохранить"
  @override
  String get bottom_navigation_film_screenSaveBottomNavBarItem => "Сохранить";
  /// "Сохранение..."
  @override
  String get toast_film_screenImageIsSaving => "Сохранение...";
  /// "Изображение сохранено"
  @override
  String get toast_film_screenImageIsSaved => "Изображение сохранено";
  /// "В этом фильме нет трейлера"
  @override
  String get toast_film_screenHasNotTrailer => "В этом фильме нет трейлера";

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", "US"),
      Locale("ru", "RU")
    ];
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      if (isSupported(locale)) {
        return locale;
      }
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    I18n._locale ??= locale;
    I18n._shouldReload = false;
    final String lang = I18n._locale != null ? I18n._locale.toString() : "";
    final String languageCode = I18n._locale != null ? I18n._locale.languageCode : "";
    if ("en_US" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("ru_RU" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_ru_RU());
    }
    else if ("en" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("ru" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_ru_RU());
    }

    return SynchronousFuture<WidgetsLocalizations>(const I18n());
  }

  @override
  bool isSupported(Locale locale) {
    for (var i = 0; i < supportedLocales.length && locale != null; i++) {
      final l = supportedLocales[i];
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => I18n._shouldReload;
}