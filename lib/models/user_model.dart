import 'package:firebase_auth/firebase_auth.dart';

GoogleAuthCredential? googleAuthCredential;

class UserModel {
  String? email;
  String? name;
  String? uId;

  UserModel({this.email, this.uId, this.name});
  UserModel.fromJason(Map<String, dynamic> json) {
    email = json['email'];
    uId = json['uId'] ?? googleAuthCredential!.idToken;
    name = json["name"];
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'uId': uId, 'name': name};
  }
}
