import 'package:animals_app/models/i_model.dart';

class AuthModel extends IModel {
  String email;
  String password;
  bool returnSecureToken;

  AuthModel({this.email, this.password, this.returnSecureToken});

  AuthModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    returnSecureToken = json['returnSecureToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['returnSecureToken'] = this.returnSecureToken;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return AuthModel.fromJson(json);
  }
}
