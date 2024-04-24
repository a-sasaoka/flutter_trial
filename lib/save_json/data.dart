import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

/// 会社
@freezed
class Company with _$Company {
  /// factoryコンストラクタ
  const factory Company({
    // 会社名
    required String name,
    // 住所
    required String address,
    // 従業員
    required List<Employee> person,
  }) = _Company;

  /// JSON用factoryコンストラクタ
  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}

/// 従業員
@freezed
class Employee with _$Employee {
  /// factoryコンストラクタ
  const factory Employee({
    // 名前
    required String name,
    // 年齢
    required int age,
  }) = _Employee;

  /// JSON用factoryコンストラクタ
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}
