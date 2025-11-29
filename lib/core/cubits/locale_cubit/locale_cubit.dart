import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/shared_preferences_singleton.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial()) {
    _loadSavedLocale();
  }

  void _loadSavedLocale() {
    try {
      final languageCode = SharedPreferencesSingleton.getString(
        'language_code',
      );
      if (languageCode != null &&
          languageCode.isNotEmpty &&
          isValidLanguageCode(languageCode)) {
        emit(LocaleChanged(Locale(languageCode)));
      } else {
        emit(LocaleChanged(const Locale('ar')));
      }
    } catch (e) {
      emit(LocaleChanged(const Locale('ar')));
    }
  }

  bool isValidLanguageCode(String code) {
    return code.length == 2 && RegExp(r'^[a-z]{2}$').hasMatch(code);
  }

  void changeLocale(String languageCode) {
    if (!isValidLanguageCode(languageCode)) {
      return;
    }
    final newLocale = Locale(languageCode);
    SharedPreferencesSingleton.setString('language_code', languageCode);
    emit(LocaleChanged(newLocale));
  }

  Locale get currentLocale {
    if (state is LocaleChanged) {
      return (state as LocaleChanged).locale;
    }
    return const Locale('ar');
  }
}
