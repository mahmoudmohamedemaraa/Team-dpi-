import 'package:flutter/material.dart';
import '../../generated/l10n.dart';

String getErrorMessage(BuildContext context, String errorCode) {
  final s = S.of(context);

  switch (errorCode) {
    // Auth errors
    case 'DELETE_ACCOUNT_ERROR':
      return s.deleteAccountError;
    case 'INCORRECT_EMAIL_OR_PASSWORD':
      return s.incorrectEmailOrPassword;
    case 'NETWORK_CONNECTION_FAILED':
      return s.networkConnectionFailed;
    case 'SIGN_IN_FAILED':
      return s.signInFailed;
    case 'UNKNOWN_SIGN_IN_ERROR':
      return s.unknownSignInError;
    case 'WEAK_PASSWORD':
      return s.weakPassword;
    case 'EMAIL_ALREADY_IN_USE':
      return s.emailAlreadyInUse;
    case 'ACCOUNT_CREATION_FAILED':
      return s.accountCreationFailed;
    case 'UNKNOWN_ACCOUNT_CREATION_ERROR':
      return s.unknownAccountCreationError;
    case 'SIGN_OUT_ERROR':
      return s.signOutError;
    case 'USER_NOT_FOUND':
      return s.userNotFound;
    case 'INVALID_EMAIL':
      return s.invalidEmail;
    case 'PASSWORD_RESET_FAILED':
      return s.passwordResetFailed;
    case 'NATIONAL_ID_EXISTS':
      return s.nationalIdExists;
    case 'UNKNOWN_ERROR':
      return s.unknownError;

    case 'FAILED_TO_UPLOAD_MEDIA':
      return s.failedToUploadMedia;

    // Cloudinary errors
    case 'CLOUDINARY_UPLOAD_FAILED':
      return s.cloudinaryUploadFailed;
    case 'CLOUDINARY_API_ERROR':
      return s.cloudinaryApiError;
    case 'NO_SECURE_URL_FOUND':
      return s.noSecureUrlFound;
    case 'NETWORK_OR_API_ERROR':
      return s.networkOrApiError;
    case 'UNEXPECTED_CLOUDINARY_ERROR':
      return s.unexpectedError;

    // Report errors
    case 'FAILED_TO_ADD_REPORT':
      return s.failedToAddReport;

    // National ID verification errors
    case 'NATIONAL_ID_ALREADY_REGISTERED':
      return s.nationalIdExists;
    case 'ERROR_CHECKING_NATIONAL_ID':
      return s.errorCheckingNationalId;

    // Notification errors
    case 'CANNOT_FETCH_NOTIFICATIONS':
      return s.cannotFetchNotifications;
    case 'INVALID_NOTIFICATION_ID':
      return s.invalidNotificationId;
    case 'FAILED_TO_UPDATE_NOTIFICATION_STATUS':
      return s.failedToUpdateNotificationStatus;
    case 'REPORT_NOT_FOUND':
      return s.reportNotFound;
    case 'FAILED_TO_LOAD_REPORT_DATA':
      return s.failedToLoadReportData;

    // User Reports errors
    case 'USER_ID_MISSING':
      return s.userIdMissing;
    case 'FAILED_TO_LOAD_USER_REPORTS':
      return s.failedToLoadUserReports;

    // National ID lookup errors
    case 'NATIONAL_ID_NOT_REGISTERED':
      return s.nationalIdNotRegistered;
    case 'DATA_LOOKUP_ERROR':
      return s.dataLookupError;
    case 'NATIONAL_ID_NOT_FOUND_FOR_EMAIL':
      return s.nationalIdNotFoundForEmail;
    case 'ERROR_RETRIEVING_NATIONAL_ID':
      return s.errorRetrievingNationalId;

    // Default fallback
    default:
      return errorCode; // Return the code itself if no translation found
  }
}
