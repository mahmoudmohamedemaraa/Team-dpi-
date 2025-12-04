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

  /// `easily and quickly`
  String get reportButtonDiscriptionContinue {
    return Intl.message(
      'easily and quickly',
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

  /// `Ministry Awareness`
  String get ministryAwareness {
    return Intl.message(
      'Ministry Awareness',
      name: 'ministryAwareness',
      desc: '',
      args: [],
    );
  }

  /// `Cyber Fraud Warning`
  String get cyberFraudWarning {
    return Intl.message(
      'Cyber Fraud Warning',
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

  /// `Reporting Cybercrimes`
  String get reportingCybercrimes {
    return Intl.message(
      'Reporting Cybercrimes',
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

  /// `Report Title`
  String get reportTitle {
    return Intl.message(
      'Report Title',
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

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
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

  /// `There are no reports from this user`
  String get noReports {
    return Intl.message(
      'There are no reports from this user',
      name: 'noReports',
      desc: '',
      args: [],
    );
  }

  /// `Error While Loading`
  String get errorWhileLouding {
    return Intl.message(
      'Error While Loading',
      name: 'errorWhileLouding',
      desc: '',
      args: [],
    );
  }

  /// `Enable two-factor authentication (2FA) to protect your accounts from hacking.`
  String get tip1 {
    return Intl.message(
      'Enable two-factor authentication (2FA) to protect your accounts from hacking.',
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

  /// `Use and regularly update security software to protect against viruses and hacks.`
  String get tip4 {
    return Intl.message(
      'Use and regularly update security software to protect against viruses and hacks.',
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

  /// `Example: Robbing a store`
  String get reportEx {
    return Intl.message(
      'Example: Robbing a store',
      name: 'reportEx',
      desc: '',
      args: [],
    );
  }

  /// `Enter report description`
  String get enterReportDescription {
    return Intl.message(
      'Enter report description',
      name: 'enterReportDescription',
      desc: '',
      args: [],
    );
  }

  /// `Report description should be at least 10 characters`
  String get reportDescriptionAtLeast10 {
    return Intl.message(
      'Report description should be at least 10 characters',
      name: 'reportDescriptionAtLeast10',
      desc: '',
      args: [],
    );
  }

  /// `Report Description`
  String get reportDescription {
    return Intl.message(
      'Report Description',
      name: 'reportDescription',
      desc: '',
      args: [],
    );
  }

  /// `Write report description`
  String get writeReportDescription {
    return Intl.message(
      'Write report description',
      name: 'writeReportDescription',
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

  /// `Example: Downtown, Cairo`
  String get locationEx {
    return Intl.message(
      'Example: Downtown, Cairo',
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

  /// `You should add at least one photo or video`
  String get mustAddMedia {
    return Intl.message(
      'You should add at least one photo or video',
      name: 'mustAddMedia',
      desc: '',
      args: [],
    );
  }

  /// `Send Report`
  String get sendingReport {
    return Intl.message(
      'Send Report',
      name: 'sendingReport',
      desc: '',
      args: [],
    );
  }

  /// `Adding Photo`
  String get addingPhoto {
    return Intl.message(
      'Adding Photo',
      name: 'addingPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Adding Video`
  String get addingVideo {
    return Intl.message(
      'Adding Video',
      name: 'addingVideo',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message('Sign in', name: 'signIn', desc: '', args: []);
  }

  /// `Signed in successfully`
  String get signInSuccess {
    return Intl.message(
      'Signed in successfully',
      name: 'signInSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Didn't sign in`
  String get notSignedIn {
    return Intl.message(
      'Didn\'t sign in',
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

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
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

  /// `Sending Reset Link`
  String get sendingLinkReset {
    return Intl.message(
      'Sending Reset Link',
      name: 'sendingLinkReset',
      desc: '',
      args: [],
    );
  }

  /// `Back to Sign In`
  String get backSignIn {
    return Intl.message(
      'Back to Sign In',
      name: 'backSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign in has failed`
  String get singInFailing {
    return Intl.message(
      'Sign in has failed',
      name: 'singInFailing',
      desc: '',
      args: [],
    );
  }

  /// `Signup has failed`
  String get signupFailed {
    return Intl.message(
      'Signup has failed',
      name: 'signupFailed',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get fristName {
    return Intl.message('First Name', name: 'fristName', desc: '', args: []);
  }

  /// `Eddard`
  String get fristNameEx {
    return Intl.message('Eddard', name: 'fristNameEx', desc: '', args: []);
  }

  /// `Last Name`
  String get LastName {
    return Intl.message('Last Name', name: 'LastName', desc: '', args: []);
  }

  /// `Stark`
  String get LastNameEx {
    return Intl.message('Stark', name: 'LastNameEx', desc: '', args: []);
  }

  /// `Please enter your national ID`
  String get enterNationalId {
    return Intl.message(
      'Please enter your national ID',
      name: 'enterNationalId',
      desc: '',
      args: [],
    );
  }

  /// `National ID must contain only numbers`
  String get nationalIdOnlyNums {
    return Intl.message(
      'National ID must contain only numbers',
      name: 'nationalIdOnlyNums',
      desc: '',
      args: [],
    );
  }

  /// `National ID must be exactly 14 digits`
  String get nationalIdAtleastNums {
    return Intl.message(
      'National ID must be exactly 14 digits',
      name: 'nationalIdAtleastNums',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get enterPhone {
    return Intl.message(
      'Enter Phone Number',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must contain only numbers`
  String get phoneNumberOnlyNums {
    return Intl.message(
      'Phone number must contain only numbers',
      name: 'phoneNumberOnlyNums',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must be 11 digits`
  String get phoneNumber11 {
    return Intl.message(
      'Phone number must be 11 digits',
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

  /// `Do you have an account?`
  String get havingAccount {
    return Intl.message(
      'Do you have an account?',
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

  /// `Please enter password`
  String get enteringPassword {
    return Intl.message(
      'Please enter password',
      name: 'enteringPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forgot your password?`
  String get forgetPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get do_notHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
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

  /// `Pending`
  String get statusPending {
    return Intl.message('Pending', name: 'statusPending', desc: '', args: []);
  }

  /// `In Review`
  String get statusInReview {
    return Intl.message(
      'In Review',
      name: 'statusInReview',
      desc: '',
      args: [],
    );
  }

  /// `Investigating`
  String get statusInvestigating {
    return Intl.message(
      'Investigating',
      name: 'statusInvestigating',
      desc: '',
      args: [],
    );
  }

  /// `Resolved`
  String get statusResolved {
    return Intl.message('Resolved', name: 'statusResolved', desc: '', args: []);
  }

  /// `Rejected`
  String get statusRejected {
    return Intl.message('Rejected', name: 'statusRejected', desc: '', args: []);
  }

  /// `Report Status Updated`
  String get reportStatusUpdated {
    return Intl.message(
      'Report Status Updated',
      name: 'reportStatusUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Your report status has been changed to`
  String get reportStatusChangedTo {
    return Intl.message(
      'Your report status has been changed to',
      name: 'reportStatusChangedTo',
      desc: '',
      args: [],
    );
  }

  /// `Now`
  String get now {
    return Intl.message('Now', name: 'now', desc: '', args: []);
  }

  /// `since`
  String get since {
    return Intl.message('since', name: 'since', desc: '', args: []);
  }

  /// `minute`
  String get minute {
    return Intl.message('minute', name: 'minute', desc: '', args: []);
  }

  /// `minutes`
  String get minutes {
    return Intl.message('minutes', name: 'minutes', desc: '', args: []);
  }

  /// `hour`
  String get hour {
    return Intl.message('hour', name: 'hour', desc: '', args: []);
  }

  /// `hours`
  String get hours {
    return Intl.message('hours', name: 'hours', desc: '', args: []);
  }

  /// `day`
  String get day {
    return Intl.message('day', name: 'day', desc: '', args: []);
  }

  /// `days`
  String get days {
    return Intl.message('days', name: 'days', desc: '', args: []);
  }

  /// `Choose Language`
  String get chooseLanguage {
    return Intl.message(
      'Choose Language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Failed to pick images`
  String get failedToPickImages {
    return Intl.message(
      'Failed to pick images',
      name: 'failedToPickImages',
      desc: '',
      args: [],
    );
  }

  /// `Failed to pick video`
  String get failedToPickVideo {
    return Intl.message(
      'Failed to pick video',
      name: 'failedToPickVideo',
      desc: '',
      args: [],
    );
  }

  /// `Failed to upload media`
  String get failedToUploadMedia {
    return Intl.message(
      'Failed to upload media',
      name: 'failedToUploadMedia',
      desc: '',
      args: [],
    );
  }

  /// `Cloudinary upload failed`
  String get cloudinaryUploadFailed {
    return Intl.message(
      'Cloudinary upload failed',
      name: 'cloudinaryUploadFailed',
      desc: '',
      args: [],
    );
  }

  /// `Cloudinary API Error`
  String get cloudinaryApiError {
    return Intl.message(
      'Cloudinary API Error',
      name: 'cloudinaryApiError',
      desc: '',
      args: [],
    );
  }

  /// `Upload successful but no valid secure_url found in response`
  String get noSecureUrlFound {
    return Intl.message(
      'Upload successful but no valid secure_url found in response',
      name: 'noSecureUrlFound',
      desc: '',
      args: [],
    );
  }

  /// `Network or API error during Cloudinary upload`
  String get networkOrApiError {
    return Intl.message(
      'Network or API error during Cloudinary upload',
      name: 'networkOrApiError',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred during Cloudinary upload`
  String get unexpectedError {
    return Intl.message(
      'An unexpected error occurred during Cloudinary upload',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while deleting the account. Please try again.`
  String get deleteAccountError {
    return Intl.message(
      'An error occurred while deleting the account. Please try again.',
      name: 'deleteAccountError',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email or password.`
  String get incorrectEmailOrPassword {
    return Intl.message(
      'Incorrect email or password.',
      name: 'incorrectEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Network connection failed. Please check your internet connection.`
  String get networkConnectionFailed {
    return Intl.message(
      'Network connection failed. Please check your internet connection.',
      name: 'networkConnectionFailed',
      desc: '',
      args: [],
    );
  }

  /// `Sign in failed. Please check your credentials and try again.`
  String get signInFailed {
    return Intl.message(
      'Sign in failed. Please check your credentials and try again.',
      name: 'signInFailed',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred during sign in. Please try again.`
  String get unknownSignInError {
    return Intl.message(
      'An unknown error occurred during sign in. Please try again.',
      name: 'unknownSignInError',
      desc: '',
      args: [],
    );
  }

  /// `The password is too weak.`
  String get weakPassword {
    return Intl.message(
      'The password is too weak.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `This email address is already in use.`
  String get emailAlreadyInUse {
    return Intl.message(
      'This email address is already in use.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Account creation failed. Please try again.`
  String get accountCreationFailed {
    return Intl.message(
      'Account creation failed. Please try again.',
      name: 'accountCreationFailed',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred while creating the account. Please try again.`
  String get unknownAccountCreationError {
    return Intl.message(
      'An unknown error occurred while creating the account. Please try again.',
      name: 'unknownAccountCreationError',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred during sign out. Please try again.`
  String get signOutError {
    return Intl.message(
      'An error occurred during sign out. Please try again.',
      name: 'signOutError',
      desc: '',
      args: [],
    );
  }

  /// `No account registered with this email address.`
  String get userNotFound {
    return Intl.message(
      'No account registered with this email address.',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address.`
  String get invalidEmail {
    return Intl.message(
      'Invalid email address.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send password reset link.`
  String get passwordResetFailed {
    return Intl.message(
      'Failed to send password reset link.',
      name: 'passwordResetFailed',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred. Please try again.`
  String get unknownError {
    return Intl.message(
      'An unknown error occurred. Please try again.',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `This national ID is already registered`
  String get nationalIdExists {
    return Intl.message(
      'This national ID is already registered',
      name: 'nationalIdExists',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while adding the report`
  String get failedToAddReport {
    return Intl.message(
      'An error occurred while adding the report',
      name: 'failedToAddReport',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get fieldRequired {
    return Intl.message(
      'This field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while verifying the national ID`
  String get errorCheckingNationalId {
    return Intl.message(
      'An error occurred while verifying the national ID',
      name: 'errorCheckingNationalId',
      desc: '',
      args: [],
    );
  }

  /// `Cannot fetch notifications`
  String get cannotFetchNotifications {
    return Intl.message(
      'Cannot fetch notifications',
      name: 'cannotFetchNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Invalid notification ID`
  String get invalidNotificationId {
    return Intl.message(
      'Invalid notification ID',
      name: 'invalidNotificationId',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update notification status`
  String get failedToUpdateNotificationStatus {
    return Intl.message(
      'Failed to update notification status',
      name: 'failedToUpdateNotificationStatus',
      desc: '',
      args: [],
    );
  }

  /// `Report not found`
  String get reportNotFound {
    return Intl.message(
      'Report not found',
      name: 'reportNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load report data`
  String get failedToLoadReportData {
    return Intl.message(
      'Failed to load report data',
      name: 'failedToLoadReportData',
      desc: '',
      args: [],
    );
  }

  /// `User ID is missing`
  String get userIdMissing {
    return Intl.message(
      'User ID is missing',
      name: 'userIdMissing',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while loading user reports`
  String get failedToLoadUserReports {
    return Intl.message(
      'An error occurred while loading user reports',
      name: 'failedToLoadUserReports',
      desc: '',
      args: [],
    );
  }

  /// `National ID not registered. Please check your data`
  String get nationalIdNotRegistered {
    return Intl.message(
      'National ID not registered. Please check your data',
      name: 'nationalIdNotRegistered',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while looking up data`
  String get dataLookupError {
    return Intl.message(
      'An error occurred while looking up data',
      name: 'dataLookupError',
      desc: '',
      args: [],
    );
  }

  /// `National ID not found for this email`
  String get nationalIdNotFoundForEmail {
    return Intl.message(
      'National ID not found for this email',
      name: 'nationalIdNotFoundForEmail',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while retrieving national ID`
  String get errorRetrievingNationalId {
    return Intl.message(
      'An error occurred while retrieving national ID',
      name: 'errorRetrievingNationalId',
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
