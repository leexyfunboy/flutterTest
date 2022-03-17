import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  late String userid;
  late String username;
  late String telephone;
  late String email;
  late String password;
  late String companyid;
  late String projectid;
  late String deptid;
  late num authority_message;
  late num authority_action;
  late num authority_admin;
  late num job_status;
  
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
