part of 'locale_cubit.dart';

abstract class LocaleState {
  const LocaleState();
}

class LocaleInitial extends LocaleState {}

class LocaleChanged extends LocaleState {
  final Locale locale;

  const LocaleChanged(this.locale);
}
