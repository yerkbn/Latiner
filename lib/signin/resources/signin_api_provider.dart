import 'package:latiner/auth/model/user.dart';

class SigninApiProvider {
  Future<User> fetchAuthenticate(String username) async {
    /// this simulate server here you have to fetch
    /// data from server below shown example
    await Future.delayed(Duration(milliseconds: 500));
    return User.parseMap(
        {'email': 'yerkebulan@gmail.com', 'token': 'sdfsdfmb324343jkjk32jk42'});
  }
}

// Future<User> fetchAuthenticate(String username, String password) async {
//   Map<String, String> body = {'username': username, 'password': password};
//   Response response = await post('$BACKEND_URL/api-token-auth/',
//       headers: {
//         "Accept": "application/json",
//         "Content-Type": "application/x-www-form-urlencoded"
//       },
//       body: body,
//       encoding: Encoding.getByName("utf-8") //
//       );
//   if (response.statusCode >= 400 && response.statusCode < 500) {
//     String mess = json.decode(response.body)['detail'];
//     if (mess == 'please, activate account')
//       throw ('Пожалуйста, активируйте аккаунт');
//     throw ('пользователь не найден');
//   } else if (response.statusCode >= 300) {
//     throw ('повторите попытку позже возникла внутренняя проблема');
//   } else if (response.statusCode >= 200 && response.statusCode < 300) {
//     String decoded = utf8.decode(response.bodyBytes);
//     User user = User.parseJson(decoded);
//     return user;
//   }
// }
