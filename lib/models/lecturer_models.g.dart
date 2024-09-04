// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecturer_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lecturer _$LecturerFromJson(Map<String, dynamic> json) => Lecturer(
      id: json['id'] as String,
      name: json['name'] as String,
      department: json['department'] as String,
      onCampus: json['onCampus'] as bool,
      busy: json['busy'] as bool,
    );

Map<String, dynamic> _$LecturerToJson(Lecturer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'department': instance.department,
      'onCampus': instance.onCampus,
      'busy': instance.busy,
    };
