import 'i_model.dart';

class AuthSuccessModel extends IModel {
  String kind;
  String localId;
  String email;
  String displayName;
  String idToken;
  bool registered;
  String refreshToken;
  String expiresIn;

  AuthSuccessModel(
      {this.kind,
      this.localId,
      this.email,
      this.displayName,
      this.idToken,
      this.registered,
      this.refreshToken,
      this.expiresIn});

  AuthSuccessModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    localId = json['localId'];
    email = json['email'];
    displayName = json['displayName'];
    idToken = json['idToken'];
    registered = json['registered'];
    refreshToken = json['refreshToken'];
    expiresIn = json['expiresIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['localId'] = this.localId;
    data['email'] = this.email;
    data['displayName'] = this.displayName;
    data['idToken'] = this.idToken;
    data['registered'] = this.registered;
    data['refreshToken'] = this.refreshToken;
    data['expiresIn'] = this.expiresIn;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return AuthSuccessModel.fromJson(json);
  }
}
