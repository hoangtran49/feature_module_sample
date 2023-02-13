import 'package:ddd_arch/shared/dto/user_dto.dart';

import '../../models/user.dart';

class UserMapper {
  UserMapper._();

  static User fromUserDto(UserDto userDto) {
    return User(
      name: userDto.firstName + userDto.lastName,
      birthDay: userDto.birthDay,
    );
  }

  static UserDto toUserDto(User user) {
    final names = user.name.split(' ');
    return UserDto(
        firstName: names[0], lastName: names[1], birthDay: user.birthDay);
  }
}
