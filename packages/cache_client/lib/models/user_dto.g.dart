// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDTOAdapter extends TypeAdapter<UserDTO> {
  @override
  final int typeId = 0;

  @override
  UserDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDTO(
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserDTO obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
