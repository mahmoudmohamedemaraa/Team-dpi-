import 'package:depi_project/core/repos/media_repo/media_repo.dart';
import 'package:depi_project/core/repos/media_repo/media_repo_impl.dart';
import 'package:depi_project/features/add_report/data/repos/add_report_repo_impl.dart';
import 'package:depi_project/features/notifications/data/repos/notifications_repo_impl.dart';
import 'package:depi_project/features/notifications/domain/repos/notifications_repo.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import '../../features/add_report/domain/repos/add_report_repo.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import 'cloudinary_service.dart';
import 'database_service.dart';
import 'firebase_auth_service.dart';
import 'firestore_sevice.dart';
import 'storage_service.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplementation(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<StorageService>(
    CloudinaryService(
      cloudName: dotenv.env['CLOUDINARY_CLOUD_NAME']!,
      uploadPreset: dotenv.env['CLOUDINARY_UPLOAD_PRESET']!,
      apiKey: dotenv.env['CLOUDINARY_API_KEY']!,
    ),
  );
  getIt.registerSingleton<MediaRepo>(
    MediaRepoImpl(getIt.get<StorageService>()),
  );
  getIt.registerSingleton<AddReportRepo>(
    AddReportRepoImpl(getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<NotificationsRepo>(
    NotificationsRepoImpl(getIt.get<DatabaseService>()),
  );
}
