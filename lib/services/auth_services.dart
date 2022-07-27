part of 'services.dart';

class AuthService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<UserModel> register({
    String name = "",
    String username = "",
    String email = "",
    String password = "",
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {"Content-Type": "application/json"};
    var body = jsonEncode(<String, String>{
      'name': name,
      'username': username,
      'email': email,
      'password': password
    });

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['data']['user']);
      user.token = data['data']['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    String email = "",
    String password = "",
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {"Content-Type": "application/json"};
    var body =
        jsonEncode(<String, String>{'email': email, 'password': password});

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['data']['user']);
      user.token = data['data']['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }
}
