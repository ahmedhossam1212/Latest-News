class UserModel {
  String? email;
  String? name;
  String? uId;
  String? image;

  UserModel({this.email, this.uId, this.name, this.image});
  UserModel.fromJason(Map<String, dynamic> json) {
    email = json['email'];
    uId = json['uId'];
    name = json["name"];
    image = json["image"] ??
        "https://e7.pngegg.com/pngimages/282/256/png-clipart-user-profile-avatar-computer-icons-google-account-black-accounting.png";
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'uId': uId, 'name': name, 'image': image};
  }
}
