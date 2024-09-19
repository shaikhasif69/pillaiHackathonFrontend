import 'package:hive/hive.dart';

part 'student.g.dart';

@HiveType(typeId: 0)
class Student extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String department;

  @HiveField(5)
  final String year;

  @HiveField(6)
  final String address;

  @HiveField(7)
  final bool handicapped;

  Student({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.department,
    required this.year,
    required this.address,
    required this.handicapped,
  });
}
