import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {
  String actor;
  String actorId;
  String character;

  Cast({this.actor, this.actorId, this.character});

  static const fromJsonFactory = _$CastFromJson;

  factory Cast.fromJson(Map<String, dynamic> json) =>
      _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
