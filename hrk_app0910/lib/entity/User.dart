import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';


@JsonSerializable()
class User extends Object with _$UserSerializerMixin{

  @JsonKey(name: 'userid')
  String userid;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'telephone')
  String telephone;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'companyid')
  String companyid;

  @JsonKey(name: 'projectid')
  String projectid;

  @JsonKey(name: 'deptid')
  String deptid;

  @JsonKey(name: 'authority_message')
  int authorityMessage;

  @JsonKey(name: 'authority_action')
  int authorityAction;

  @JsonKey(name: 'authority_admin')
  int authorityAdmin;

  @JsonKey(name: 'job_status')
  int jobStatus;

  User(this.userid,this.username,this.telephone,this.email,this.password,this.companyid,this.projectid,this.deptid,this.authorityMessage,this.authorityAction,this.authorityAdmin,this.jobStatus,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

}


