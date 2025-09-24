// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarificResponse _$CalendarificResponseFromJson(
  Map<String, dynamic> json,
) => CalendarificResponse(
  meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
  response: CalendarificResponseData.fromJson(
    json['response'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CalendarificResponseToJson(
  CalendarificResponse instance,
) => <String, dynamic>{'meta': instance.meta, 'response': instance.response};

Meta _$MetaFromJson(Map<String, dynamic> json) =>
    Meta(code: (json['code'] as num).toInt());

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'code': instance.code,
};

CalendarificResponseData _$CalendarificResponseDataFromJson(
  Map<String, dynamic> json,
) => CalendarificResponseData(
  holidays:
      (json['holidays'] as List<dynamic>)
          .map((e) => Holiday.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CalendarificResponseDataToJson(
  CalendarificResponseData instance,
) => <String, dynamic>{'holidays': instance.holidays};

Holiday _$HolidayFromJson(Map<String, dynamic> json) => Holiday(
  name: json['name'] as String,
  date: HolidayDate.fromJson(json['date'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HolidayToJson(Holiday instance) => <String, dynamic>{
  'name': instance.name,
  'date': instance.date,
};

HolidayDate _$HolidayDateFromJson(Map<String, dynamic> json) =>
    HolidayDate(iso: json['iso'] as String);

Map<String, dynamic> _$HolidayDateToJson(HolidayDate instance) =>
    <String, dynamic>{'iso': instance.iso};
