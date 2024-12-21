import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:islameet/presentation/welcome_page/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void setAccessToken(String accessToken) {
    emit(AuthState.fromPrev(prevState: state, accessToken: accessToken));
  }

  void setRefreshToken(String refreshToken) {
    emit(AuthState.fromPrev(prevState: state, refreshToken: refreshToken));
  }

  void setGender(bool isMale) {
    emit(AuthState.fromPrev(prevState: state, isMale: isMale));
  }

  void setName(String name) {
    emit(AuthState.fromPrev(prevState: state, name: name));
  }

  void setEmail(String email) {
    emit(AuthState.fromPrev(prevState: state, email: email));
  }

  void setDescription(String description) {
    emit(AuthState.fromPrev(prevState: state, description: description));
  }

  void setCity(String city) {
    emit(AuthState.fromPrev(prevState: state, city: city));
  }

  void setPhotoURL(String photoURL) {
    emit(AuthState.fromPrev(prevState: state, photoURL: photoURL));
  }

  void setId(int id) {
    emit(AuthState.fromPrev(prevState: state, id: id));
  }

  void setBirthday(DateTime birthday) {
    emit(AuthState.fromPrev(prevState: state, birthday: birthday));
  }

  int getId() => state.id!;

  void setPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', state.id ?? -1);
    await prefs.setBool('isMale', state.isMale ?? false);
    await prefs.setString('name', state.name ?? '');
    await prefs.setString('email', state.email ?? '');
    await prefs.setString('photoUrl', state.photoEncoded ?? '');
    await prefs.setString('city', state.city ?? '');
    await prefs.setString('description', state.description ?? '');
    await prefs.setString(
      'birthday',
      DateFormat('MM.dd.yyyy').format(state.birthday ?? DateTime(2000)),
    );
  }

  void sendUserInfo() async {
    String url = 'localhost:6100';
    final response = await http.post(Uri.http(url, '/user'),
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer ${state.accessToken ?? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MzIxOTkyNDUsImlhdCI6MTczMjE5MjA0NSwiaWQiOjF9.y81oUsf9uUZ8K3yIkh2kpOobX0-hT0vWUf2WIPys_PI'}',
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        },
        body: jsonEncode({
          'name': state.name,
          'description': state.description,
          'isMale': state.isMale,
          'birthdayStamp': state.birthday?.millisecondsSinceEpoch,
          'photoURL': state.photoEncoded,
        }));
    print(response.statusCode);
    final body = json.decode(response.body) as Map<String, dynamic>;
    print(body['data']);
    int id = body['data']['id'];
  }
}
