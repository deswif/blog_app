library cache_client;

import 'package:auth_repository/auth_repository.dart';
import 'package:cache_client/mapper.dart';
import 'package:cache_client/models/user_dto.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class CacheClient {
  late Box<UserDTO> _userBox;

  static const _userBoxName = '__user_box__';
  static const _userKey = '__user_key__';

  Future<void> init() async {
    Hive.registerAdapter(UserDTOAdapter());
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    _userBox = await Hive.openBox<UserDTO>(_userBoxName);
  }

  void write(User user) {
    _userBox.put(_userKey, Mapper.fromUserToDTO(user));
  }

  User? read() {
    final dto = _userBox.get(_userKey);
    if (dto == null) return null;

    return Mapper.fromDTOToUser(dto);
  }
}
