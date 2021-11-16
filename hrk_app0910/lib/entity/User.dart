import 'package:flutter/material.dart';

class User{

  var userid;
  var username;
  var telephone;
  var email;
  var password;
  var companyid;
  var projectid;
  var deptid;
  var authority_message;
  var authority_action;
  var authority_admin;
  var job_status;
  var note;

  // User();

  User(
      this.userid,
      this.username,
      this.telephone,
      this.email,
      this.password,
      this.companyid,
      this.projectid,
      this.deptid,
      this.authority_message,
      this.authority_action,
      this.authority_admin,
      this.job_status,
      this.note);
}