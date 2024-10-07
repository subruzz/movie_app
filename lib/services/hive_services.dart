// user_service.dart
import 'package:hive/hive.dart';
import '../../model/user.dart';

class UserService {
  final Box<User> userBox;

  UserService(this.userBox);

  Future<bool> userExists(String name, String password) async {
    // Check if a user with the same username and password already exists.
    for (var existingUser in userBox.values) {
      if (existingUser.name == name && existingUser.password == password) {
        return true; // User exists
      }
    }
    return false; // User does not exist
  }

  Future<void> addUser(User user) async {
    await userBox.add(user); // Store user by username
  }

  Future<User?> getUser(String name, String password) async {
    // Retrieve the user by checking both username and password.
    for (var existingUser in userBox.values) {
      if (existingUser.name == name && existingUser.password == password) {
        return existingUser; // Return the found user
      }
    }
    return null; // No user found
  }
}
