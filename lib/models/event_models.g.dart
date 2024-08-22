// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      shortDesc: json['shortDesc'] as String? ?? '',
      description: json['description'] as String? ?? '',
      time: json['time'] as String? ?? '',
      venue: json['venue'] as String? ?? '',
      date: json['date'] as String? ?? '',
      requiresRegistration: json['requiresRegistration'] as bool,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortDesc': instance.shortDesc,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'time': instance.time,
      'venue': instance.venue,
      'date': instance.date,
      'requiresRegistration': instance.requiresRegistration,
    };
