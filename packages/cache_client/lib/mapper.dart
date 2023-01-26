import 'package:auth_repository/auth_repository.dart';
import 'package:cache_client/models/user_dto.dart';

class Mapper {
  static UserDTO fromUserToDTO(User user) {
    return UserDTO(id: user.id);
  }

  static User fromDTOToUser(UserDTO dto) {
    return User(id: dto.id);
  }
}
