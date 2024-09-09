import 'package:json_annotation/json_annotation.dart';

part 'lecturer_models.g.dart';


@JsonSerializable()
class Lecturer {
  final String id;
  final String name;
  final String department;
  final bool onCampus;
  final bool busy;

  Lecturer({
   required this.id,
   required this.name,
   required this.department,
   required this.onCampus,
   required this.busy,
  });

  factory Lecturer.fromJson(Map<String, dynamic> json) => _$LecturerFromJson(json);

  Map<String, dynamic> toJson() => _$LecturerToJson(this);

}
