import 'package:hive/hive.dart';
import 'package:movie_app/model/user.dart';

class HiveService {
  static Box<User> userBox = Hive.box('users');

  static Future<void> registerUser(User user) async {
    await userBox.put(user.name, user);
  }

  static User? loginUser(String name, String password) {
    final user = userBox.get(name);
    if (user != null && user.password == password) {
      return user;
    }
    return null;
  }
}
