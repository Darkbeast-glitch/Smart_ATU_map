import 'package:json_annotation/json_annotation.dart';

part 'event_models.g.dart';

@JsonSerializable()
class Event {
  final String id;
  final String name;
  final String imageUrl;
  final String shortDesc;
  final String description;
  final String time;
  final String venue;
  final String date;
  final bool requiresRegistration;

  Event({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.shortDesc,
    required this.description,
    required this.time,
    required this.venue,
    required this.date,
    required this.requiresRegistration,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
