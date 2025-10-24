import 'dart:convert';
import 'package:depi_project/contants.dart';
import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/domain/entities/user_entity.dart';
import '../utils/shared_preferences_singleton.dart';

/// Gets the current logged-in user data from SharedPreferences.
///
/// Usage examples in Text widgets:
/// // Get the full user object
/// final user = getUser();
///
/// // Access individual fields:
/// Text('${user.firstName} ${user.lastName}')  // Display full name
/// Text('${user.email}')                       // Display email
/// Text('${user.phoneNumber}')                 // Display phone number
/// Text('${user.nationalId}')                  // Display national ID
/// Text('${user.uId}')                        // Display user ID
///
/// // Example with conditional rendering:
/// Text(
///   'مرحباً ${getUser().firstName}',
///   style: TextStyle(fontSize: 18),
/// )
///
/// // Example in a profile screen:
/// ListTile(
///   title: Text('الاسم'),
///   subtitle: Text('${getUser().firstName} ${getUser().lastName}'),
/// )
/// ```
///
/// Note: Wrap usage in try-catch as this throws if no user is logged in:
/// try {
///   final user = getUser();
///   return Text(user.firstName);
/// } catch (e) {
///   return Text('برجاء تسجيل الدخول');
/// }
/// ```
UserEntity getUser() {
  var jsonString = SharedPreferencesSingleton.getString(kUserData);

  if (jsonString == null || jsonString.isEmpty) {
    throw Exception('No user data found in SharedPreferences');
  }

  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
