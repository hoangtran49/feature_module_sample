import 'package:ddd_arch/features/profile/models/user.dart';

abstract class ProfileRepo {
  Future<User?> getUser();

  Future<void> logout();
}
