part of 'model.dart';

class UserModel {
  UserModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.profilePhotoUrl,
      this.token});
  int? id;
  String? name;
  String? username;
  String? email;
  String? profilePhotoUrl;
  String? token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      username: json['username'],
      profilePhotoUrl: json['profile_photo_url'],
      token: json['token']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'username': username,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }

  // List<Object> get props => [
  //       id,
  //       name,
  //       email,
  //       username,
  //       profilePhotoUrl,
  //       token,
  //     ];
}
