// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyImpl _$$CompanyImplFromJson(Map<String, dynamic> json) =>
    _$CompanyImpl(
      name: json['name'] as String,
      address: json['address'] as String,
      person: (json['person'] as List<dynamic>)
          .map((e) => Employee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CompanyImplToJson(_$CompanyImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'person': instance.person,
    };

_$EmployeeImpl _$$EmployeeImplFromJson(Map<String, dynamic> json) =>
    _$EmployeeImpl(
      name: json['name'] as String,
      age: json['age'] as int,
    );

Map<String, dynamic> _$$EmployeeImplToJson(_$EmployeeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
    };
