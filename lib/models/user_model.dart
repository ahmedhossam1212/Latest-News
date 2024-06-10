class UserModel {
  String? email;
  String? name;
  String? uId;

  UserModel({this.email, this.uId, this.name});
  UserModel.fromJason(Map<String, dynamic> json) {
    email = json['email'];
    uId = json['uId'];
    name = json["name"]; //CacheHelper.getData(key: 'userName');
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'uId': uId, 'name': name};
  }
}
