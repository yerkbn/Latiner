import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String token;

  User(this.email, this.token);

  /// When JSON come from backend
  /// we parse it and create User instance
  /// and it will be used
  static User parseMap(Map object) {
    return User(object['email'], object['token']);
  }

  /// when we retrive data from [shared_preferences]
  /// it will be just string that is why we [decode] it
  /// and create [User] instance
  static User jsonStringToObject(String jsonString) {
    Map object = json.decode(jsonString);
    return User(object['email'], object['token']);
  }

  /// In order to store object to [shared_preferences]
  /// we have to transform it to map and [encode] it to String
  String objectToJsonString() {
    Map objectMap = {
      'email': this.email,
      'token': this.token,
    };
    return json.encode(objectMap).toString();
  }

  @override
  List<Object> get props => [email, token];
}
