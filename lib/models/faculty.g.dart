// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faculty.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FacultyAdapter extends TypeAdapter<Faculty> {
  @override
  final int typeId = 1;

  @override
  Faculty read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Faculty(
      id: fields[0] as String,
      name: fields[1] as String,
      email: fields[2] as String,
      username: fields[3] as String,
      department: fields[4] as String,
      subjects: (fields[5] as List).cast<String>(),
      experience: fields[6] as int,
      gender: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Faculty obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.department)
      ..writeByte(5)
      ..write(obj.subjects)
      ..writeByte(6)
      ..write(obj.experience)
      ..writeByte(7)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FacultyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
