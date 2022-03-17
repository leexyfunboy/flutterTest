import 'package:json_annotation/json_annotation.dart';

part 'department.g.dart';

@JsonSerializable()
class Department {
  Department();

  late String deptid;
  late String deptname;
  late String deptadminid;
  late String companyid;
  late String projectid;
  
  factory Department.fromJson(Map<String,dynamic> json) => _$DepartmentFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}
