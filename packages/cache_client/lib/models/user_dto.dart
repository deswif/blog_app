import 'package:hive/hive.dart';

part 'user_dto.g.dart';

@HiveType(typeId: 0)
class UserDTO extends HiveObject {
  UserDTO({required this.id});

  @HiveField(0)
  String id;
}
