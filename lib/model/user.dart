import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String phoneNumber;

  @HiveField(3)
  String password;

  @HiveField(4)
  String profession;

  User(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.profession});
}
