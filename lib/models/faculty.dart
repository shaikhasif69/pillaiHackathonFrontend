import 'package:hive/hive.dart';

part 'faculty.g.dart';

@HiveType(typeId: 1)
class Faculty extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String username;

  @HiveField(4)
  final String department;

  @HiveField(5)
  final List<String> subjects;

  @HiveField(6)
  final int experience;

  @HiveField(7)
  final String gender;

  Faculty({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.department,
    required this.subjects,
    required this.experience,
    required this.gender,
  });
}
