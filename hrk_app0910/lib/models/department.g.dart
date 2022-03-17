// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department()
  ..deptid = json['deptid'] as String
  ..deptname = json['deptname'] as String
  ..deptadminid = json['deptadminid'] as String
  ..companyid = json['companyid'] as String
  ..projectid = json['projectid'] as String;

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'deptid': instance.deptid,
      'deptname': instance.deptname,
      'deptadminid': instance.deptadminid,
      'companyid': instance.companyid,
      'projectid': instance.projectid,
    };
