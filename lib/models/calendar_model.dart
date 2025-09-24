import 'package:json_annotation/json_annotation.dart';

part 'calendar_model.g.dart';

@JsonSerializable()
class CalendarificResponse {
  final Meta meta;
  final CalendarificResponseData response;

  CalendarificResponse({required this.meta, required this.response});

  factory CalendarificResponse.fromJson(Map<String, dynamic> json) =>
      _$CalendarificResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CalendarificResponseToJson(this);
}

@JsonSerializable()
class Meta {
  final int code;

  Meta({required this.code});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class CalendarificResponseData {
  final List<Holiday> holidays;

  CalendarificResponseData({required this.holidays});

  factory CalendarificResponseData.fromJson(Map<String, dynamic> json) =>
      _$CalendarificResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$CalendarificResponseDataToJson(this);
}

@JsonSerializable()
class Holiday {
  final String name;
  final HolidayDate date;

  Holiday({required this.name, required this.date});

  factory Holiday.fromJson(Map<String, dynamic> json) =>
      _$HolidayFromJson(json);
  Map<String, dynamic> toJson() => _$HolidayToJson(this);
}

@JsonSerializable()
class HolidayDate {
  final String iso;

  HolidayDate({required this.iso});

  factory HolidayDate.fromJson(Map<String, dynamic> json) =>
      _$HolidayDateFromJson(json);
  Map<String, dynamic> toJson() => _$HolidayDateToJson(this);
}
