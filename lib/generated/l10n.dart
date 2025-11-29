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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get greeting {
    return Intl.message('Hello', name: 'greeting', desc: '', args: []);
  }

  /// `Submit new report`
  String get reportButtonTitle {
    return Intl.message(
      'Submit new report',
      name: 'reportButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can submit a new report`
  String get reportButtonDiscription {
    return Intl.message(
      'You can submit a new report',
      name: 'reportButtonDiscription',
      desc: '',
      args: [],
    );
  }

  /// `Easily and quickly`
  String get reportButtonDiscriptionContinue {
    return Intl.message(
      'Easily and quickly',
      name: 'reportButtonDiscriptionContinue',
      desc: '',
      args: [],
    );
  }

  /// `Quick options`
  String get quickOptions {
    return Intl.message(
      'Quick options',
      name: 'quickOptions',
      desc: '',
      args: [],
    );
  }

  /// `My Reports`
  String get myReports {
    return Intl.message('My Reports', name: 'myReports', desc: '', args: []);
  }

  /// `Security Tips`
  String get securityTips {
    return Intl.message(
      'Security Tips',
      name: 'securityTips',
      desc: '',
      args: [],
    );
  }

  /// `Emergency Numbers`
  String get emergencyNumbers {
    return Intl.message(
      'Emergency Numbers',
      name: 'emergencyNumbers',
      desc: '',
      args: [],
    );
  }

  /// `Ministry awareness`
  String get ministryAwareness {
    return Intl.message(
      'Ministry awareness',
      name: 'ministryAwareness',
      desc: '',
      args: [],
    );
  }

  /// `Cyber ​​fraud warning`
  String get cyberFraudWarning {
    return Intl.message(
      'Cyber ​​fraud warning',
      name: 'cyberFraudWarning',
      desc: '',
      args: [],
    );
  }

  /// `Protect yourself from cybercrime,`
  String get cyberFraudWarningContinue {
    return Intl.message(
      'Protect yourself from cybercrime,',
      name: 'cyberFraudWarningContinue',
      desc: '',
      args: [],
    );
  }

  /// ` fraud, and threats`
  String get cyberFraudWarningContinue2 {
    return Intl.message(
      ' fraud, and threats',
      name: 'cyberFraudWarningContinue2',
      desc: '',
      args: [],
    );
  }

  /// `Reporting cybercrimes`
  String get reportingCybercrimes {
    return Intl.message(
      'Reporting cybercrimes',
      name: 'reportingCybercrimes',
      desc: '',
      args: [],
    );
  }

  /// `Report cybercrimes and cyber fraud `
  String get cyberFraudWarningContinue3 {
    return Intl.message(
      'Report cybercrimes and cyber fraud ',
      name: 'cyberFraudWarningContinue3',
      desc: '',
      args: [],
    );
  }

  /// `to protect yourself`
  String get cyberFraudWarningContinue4 {
    return Intl.message(
      'to protect yourself',
      name: 'cyberFraudWarningContinue4',
      desc: '',
      args: [],
    );
  }

  /// `Submit Report`
  String get submitReport {
    return Intl.message(
      'Submit Report',
      name: 'submitReport',
      desc: '',
      args: [],
    );
  }

  /// `Report title`
  String get reportTitle {
    return Intl.message(
      'Report title',
      name: 'reportTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get nationalID {
    return Intl.message('National ID', name: 'nationalID', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `There are no notifications at the moment.`
  String get noNotfi {
    return Intl.message(
      'There are no notifications at the moment.',
      name: 'noNotfi',
      desc: '',
      args: [],
    );
  }

  /// `There are no Report from that user`
  String get noReports {
    return Intl.message(
      'There are no Report from that user',
      name: 'noReports',
      desc: '',
      args: [],
    );
  }

  /// `Error While Louding`
  String get errorWhileLouding {
    return Intl.message(
      'Error While Louding',
      name: 'errorWhileLouding',
      desc: '',
      args: [],
    );
  }

  /// `Enable two-factor authentication (2FA) to protect your accounts from hacking`
  String get tip1 {
    return Intl.message(
      'Enable two-factor authentication (2FA) to protect your accounts from hacking',
      name: 'tip1',
      desc: '',
      args: [],
    );
  }

  /// `Avoid clicking on suspicious links or links sent from untrusted sources.`
  String get tip2 {
    return Intl.message(
      'Avoid clicking on suspicious links or links sent from untrusted sources.',
      name: 'tip2',
      desc: '',
      args: [],
    );
  }

  /// `Make sure that the websites you visit begin with HTTPS before entering any sensitive data.`
  String get tip3 {
    return Intl.message(
      'Make sure that the websites you visit begin with HTTPS before entering any sensitive data.',
      name: 'tip3',
      desc: '',
      args: [],
    );
  }

  /// `Use and regularly update security software to protect against viruses and hacks`
  String get tip4 {
    return Intl.message(
      'Use and regularly update security software to protect against viruses and hacks',
      name: 'tip4',
      desc: '',
      args: [],
    );
  }

  /// `Use a reliable VPN when connecting to public or open networks.`
  String get tip5 {
    return Intl.message(
      'Use a reliable VPN when connecting to public or open networks.',
      name: 'tip5',
      desc: '',
      args: [],
    );
  }

  /// `Choose strong and long passwords and do not use the same password for more than one account.`
  String get tip6 {
    return Intl.message(
      'Choose strong and long passwords and do not use the same password for more than one account.',
      name: 'tip6',
      desc: '',
      args: [],
    );
  }

  /// `Keep backups of your important data in a safe place.`
  String get tip7 {
    return Intl.message(
      'Keep backups of your important data in a safe place.',
      name: 'tip7',
      desc: '',
      args: [],
    );
  }

  /// `Report any attempted fraud or cyber threat immediately.`
  String get tip8 {
    return Intl.message(
      'Report any attempted fraud or cyber threat immediately.',
      name: 'tip8',
      desc: '',
      args: [],
    );
  }

  /// `Avoid conducting financial transactions over public Wi-Fi networks.`
  String get tip9 {
    return Intl.message(
      'Avoid conducting financial transactions over public Wi-Fi networks.',
      name: 'tip9',
      desc: '',
      args: [],
    );
  }

  /// `Update your operating system and applications to avoid security vulnerabilities.`
  String get tip10 {
    return Intl.message(
      'Update your operating system and applications to avoid security vulnerabilities.',
      name: 'tip10',
      desc: '',
      args: [],
    );
  }

  /// `Please use these numbers only in actual emergencies.`
  String get usingEmergencyNumbers {
    return Intl.message(
      'Please use these numbers only in actual emergencies.',
      name: 'usingEmergencyNumbers',
      desc: '',
      args: [],
    );
  }

  /// `Ambulance`
  String get ambulance {
    return Intl.message('Ambulance', name: 'ambulance', desc: '', args: []);
  }

  /// `Police`
  String get police {
    return Intl.message('Police', name: 'police', desc: '', args: []);
  }

  /// `Fire Fighters`
  String get fireFighters {
    return Intl.message(
      'Fire Fighters',
      name: 'fireFighters',
      desc: '',
      args: [],
    );
  }

  /// `HelpLine`
  String get HelpLine {
    return Intl.message('HelpLine', name: 'HelpLine', desc: '', args: []);
  }

  /// `Electrical emergency`
  String get electricalEmergency {
    return Intl.message(
      'Electrical emergency',
      name: 'electricalEmergency',
      desc: '',
      args: [],
    );
  }

  /// `Fire emergency`
  String get fireEmergency {
    return Intl.message(
      'Fire emergency',
      name: 'fireEmergency',
      desc: '',
      args: [],
    );
  }

  /// `Water`
  String get water {
    return Intl.message('Water', name: 'water', desc: '', args: []);
  }

  /// `Enter Report Title`
  String get enterReportTitle {
    return Intl.message(
      'Enter Report Title',
      name: 'enterReportTitle',
      desc: '',
      args: [],
    );
  }

  /// `Report title should be at least 5 letters`
  String get reportTitleAtLeast5 {
    return Intl.message(
      'Report title should be at least 5 letters',
      name: 'reportTitleAtLeast5',
      desc: '',
      args: [],
    );
  }

  /// `Report title`
  String get reporTitle {
    return Intl.message('Report title', name: 'reporTitle', desc: '', args: []);
  }

  /// `Example: Robbing a store`
  String get reportEx {
    return Intl.message(
      'Example: Robbing a store',
      name: 'reportEx',
      desc: '',
      args: [],
    );
  }

  /// `enter report describtion`
  String get enterReportDescribtion {
    return Intl.message(
      'enter report describtion',
      name: 'enterReportDescribtion',
      desc: '',
      args: [],
    );
  }

  /// `report describtion should be at least 10`
  String get reportDescribtionAtLeast10 {
    return Intl.message(
      'report describtion should be at least 10',
      name: 'reportDescribtionAtLeast10',
      desc: '',
      args: [],
    );
  }

  /// `Report describtion`
  String get reportDescribtion {
    return Intl.message(
      'Report describtion',
      name: 'reportDescribtion',
      desc: '',
      args: [],
    );
  }

  /// `Write Report describtion`
  String get writeReportDescribtion {
    return Intl.message(
      'Write Report describtion',
      name: 'writeReportDescribtion',
      desc: '',
      args: [],
    );
  }

  /// `Location (Optional)`
  String get location {
    return Intl.message(
      'Location (Optional)',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Example: wsatt albald ,Cairo`
  String get locationEx {
    return Intl.message(
      'Example: wsatt albald ,Cairo',
      name: 'locationEx',
      desc: '',
      args: [],
    );
  }

  /// `Photos & Videos`
  String get photosAndVideos {
    return Intl.message(
      'Photos & Videos',
      name: 'photosAndVideos',
      desc: '',
      args: [],
    );
  }

  /// `Tap the icons to add media`
  String get addPhotosAndVideos {
    return Intl.message(
      'Tap the icons to add media',
      name: 'addPhotosAndVideos',
      desc: '',
      args: [],
    );
  }

  /// `Alert!`
  String get alert {
    return Intl.message('Alert!', name: 'alert', desc: '', args: []);
  }

  /// `you should add atleast one photo or a video`
  String get mustAddMedia {
    return Intl.message(
      'you should add atleast one photo or a video',
      name: 'mustAddMedia',
      desc: '',
      args: [],
    );
  }

  /// `Send report`
  String get sendingReport {
    return Intl.message(
      'Send report',
      name: 'sendingReport',
      desc: '',
      args: [],
    );
  }

  /// `Adding photo`
  String get addingPhoto {
    return Intl.message(
      'Adding photo',
      name: 'addingPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Adding video`
  String get addingVideo {
    return Intl.message(
      'Adding video',
      name: 'addingVideo',
      desc: '',
      args: [],
    );
  }

  /// `signed in `
  String get signIn {
    return Intl.message('signed in ', name: 'signIn', desc: '', args: []);
  }

  /// `signed in successfully`
  String get signInSuccess {
    return Intl.message(
      'signed in successfully',
      name: 'signInSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Didn't sing in`
  String get notSignedIn {
    return Intl.message(
      'Didn\'t sing in',
      name: 'notSignedIn',
      desc: '',
      args: [],
    );
  }

  /// `A password reset link has been sent to your email address.`
  String get passwardResetSuccessfully {
    return Intl.message(
      'A password reset link has been sent to your email address.',
      name: 'passwardResetSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address or national ID number and we will send you a link to reset your password.`
  String get SendingEmailForNewPassword {
    return Intl.message(
      'Enter your email address or national ID number and we will send you a link to reset your password.',
      name: 'SendingEmailForNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address or national ID number.`
  String get enterEmailOrId {
    return Intl.message(
      'Please enter your email address or national ID number.',
      name: 'enterEmailOrId',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address or a valid national ID number.`
  String get validEmailOrId {
    return Intl.message(
      'Please enter a valid email address or a valid national ID number.',
      name: 'validEmailOrId',
      desc: '',
      args: [],
    );
  }

  /// `Email or ID`
  String get emailOrId {
    return Intl.message('Email or ID', name: 'emailOrId', desc: '', args: []);
  }

  /// `Sending Link for resetting`
  String get sendingLinkReset {
    return Intl.message(
      'Sending Link for resetting',
      name: 'sendingLinkReset',
      desc: '',
      args: [],
    );
  }

  /// `Back for Sign in`
  String get backSignIn {
    return Intl.message(
      'Back for Sign in',
      name: 'backSignIn',
      desc: '',
      args: [],
    );
  }

  /// `sing in has faild`
  String get singInFailing {
    return Intl.message(
      'sing in has faild',
      name: 'singInFailing',
      desc: '',
      args: [],
    );
  }

  /// `frist name`
  String get fristName {
    return Intl.message('frist name', name: 'fristName', desc: '', args: []);
  }

  /// `Eddard`
  String get fristNameEx {
    return Intl.message('Eddard', name: 'fristNameEx', desc: '', args: []);
  }

  /// `last name`
  String get LastName {
    return Intl.message('last name', name: 'LastName', desc: '', args: []);
  }

  /// `Stark`
  String get LastNameEx {
    return Intl.message('Stark', name: 'LastNameEx', desc: '', args: []);
  }

  /// `Please enter national ID`
  String get enterNationalId {
    return Intl.message(
      'Please enter national ID',
      name: 'enterNationalId',
      desc: '',
      args: [],
    );
  }

  /// `the national ID has to be only Numbers`
  String get nationalIdOnlyNums {
    return Intl.message(
      'the national ID has to be only Numbers',
      name: 'nationalIdOnlyNums',
      desc: '',
      args: [],
    );
  }

  /// `the national ID has to be only 14`
  String get nationalIdAtleastNums {
    return Intl.message(
      'the national ID has to be only 14',
      name: 'nationalIdAtleastNums',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get enterPhone {
    return Intl.message(
      'Enter phone number',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
  }

  /// `the Phone Number has to be only Numbers`
  String get phoneNumberOnlyNums {
    return Intl.message(
      'the Phone Number has to be only Numbers',
      name: 'phoneNumberOnlyNums',
      desc: '',
      args: [],
    );
  }

  /// `the phone number must be 11 digits`
  String get phoneNumber11 {
    return Intl.message(
      'the phone number must be 11 digits',
      name: 'phoneNumber11',
      desc: '',
      args: [],
    );
  }

  /// `Creating Account`
  String get creatingAccount {
    return Intl.message(
      'Creating Account',
      name: 'creatingAccount',
      desc: '',
      args: [],
    );
  }

  /// `Do you have account?`
  String get havingAccount {
    return Intl.message(
      'Do you have account?',
      name: 'havingAccount',
      desc: '',
      args: [],
    );
  }

  /// `Call Now`
  String get callNow {
    return Intl.message('Call Now', name: 'callNow', desc: '', args: []);
  }

  /// `Do you want to call`
  String get doYouWantToCall {
    return Intl.message(
      'Do you want to call',
      name: 'doYouWantToCall',
      desc: '',
      args: [],
    );
  }

  /// `PLease enter password`
  String get enteringPassword {
    return Intl.message(
      'PLease enter password',
      name: 'enteringPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `An error occurred while deleting the account. Please try again.`
  String get deletingAccountErrorMessage {
    return Intl.message(
      'An error occurred while deleting the account. Please try again.',
      name: 'deletingAccountErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `do you forget your passward`
  String get forgetPassword {
    return Intl.message(
      'do you forget your passward',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account`
  String get do_notHaveAccount {
    return Intl.message(
      'Don\'t have account',
      name: 'do_notHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Report Details`
  String get reportDetails {
    return Intl.message(
      'Report Details',
      name: 'reportDetails',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Photos/Videos`
  String get media {
    return Intl.message('Photos/Videos', name: 'media', desc: '', args: []);
  }

  /// `Admin Comment`
  String get adminComment {
    return Intl.message(
      'Admin Comment',
      name: 'adminComment',
      desc: '',
      args: [],
    );
  }

  /// `Report Date`
  String get reportDate {
    return Intl.message('Report Date', name: 'reportDate', desc: '', args: []);
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
