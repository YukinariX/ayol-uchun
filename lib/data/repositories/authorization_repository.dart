import '../../core/client.dart';

import '../../core/secure_storege.dart';
import '../models/authorization_models/sign_up_model.dart';
import '../models/user_models/user_model.dart';
class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;

  String? jwt;


  Future<bool> login(String login, String password) async {
    jwt = await client.login(login, password);
    await SecureStorage.deleteCredentials();
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(jwt!);
    await SecureStorage.saveCredentials(login: login, password: password);
    return true;
  }

  Future<void> logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }

  Future<bool> refreshToken() async {
    var credentials = await SecureStorage.getCredentials();
    if (credentials['login'] == null || credentials['password'] == null) {
      return false;
    }
    jwt = await client.login(credentials['login']!, credentials['password']!);
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(jwt!);
    return true;
  }

  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final result = await client.signUp(
      SignUpModel(firstName: firstName, lastName: lastName, email: email,password: password,phoneNumber: phoneNumber),
    );
    return result;
  }

  Future<UserModel>fetchUser()async{
    final rawUser = await client.fetchUser();
    return UserModel.fromJson(rawUser);
  }
}