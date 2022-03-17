// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..userid = json['userid'] as String
  ..username = json['username'] as String
  ..telephone = json['telephone'] as String
  ..email = json['email'] as String
  ..password = json['password'] as String
  ..companyid = json['companyid'] as String
  ..projectid = json['projectid'] as String
  ..deptid = json['deptid'] as String
  ..authority_message = json['authority_message'] as num
  ..authority_action = json['authority_action'] as num
  ..authority_admin = json['authority_admin'] as num
  ..job_status = json['job_status'] as num;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userid': instance.userid,
      'username': instance.username,
      'telephone': instance.telephone,
      'email': instance.email,
      'password': instance.password,
      'companyid': instance.companyid,
      'projectid': instance.projectid,
      'deptid': instance.deptid,
      'authority_message': instance.authority_message,
      'authority_action': instance.authority_action,
      'authority_admin': instance.authority_admin,
      'job_status': instance.job_status,
    };
