import 'package:latiner/auth/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  /// This is needed to find user data from
  /// [shared preferences]
  final String spKey = 'current_user';

  /// We save user to the [shared preferences]
  /// with specific key
  Future<void> persistUser(User user) async {
    SharedPreferences spInstance = await SharedPreferences.getInstance();
    await spInstance.setString(spKey, user.objectToJsonString());
  }

  /// Just clear our [shared preferences]
  Future<void> deleteUser() async {
    SharedPreferences spInstance = await SharedPreferences.getInstance();
    spInstance.clear();
  }

  /// To check Does user Authenticated or not
  Future<bool> isAuthenticated() async {
    if (await getCurrentUser() == null) {
      return false;
    }
    return true;
  }

  /// Get current user instance from [shared preferences]
  Future<User> getCurrentUser() async {
    SharedPreferences spInstance = await SharedPreferences.getInstance();
    String jsonString = spInstance.getString(spKey);
    if (jsonString != null) {
      return User.jsonStringToObject(jsonString);
    }
  }
}
