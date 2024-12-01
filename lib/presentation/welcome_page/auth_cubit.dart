import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islameet/presentation/welcome_page/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

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
    await prefs.setInt('id', state.id!);
    await prefs.setBool('isMale', state.isMale ?? false);
    await prefs.setString('name', state.name ?? '');
    await prefs.setString('email', state.email ?? '');
    await prefs.setString('photoUrl', state.photoURL ?? '');
    await prefs.setString('city', state.city ?? '');
    await prefs.setString('description', state.description ?? '');
    // await prefs.setString('birthday',
    //     '${state.birthday!.year}-${state.birthday!.month}-${state.birthday!.day}');
  }
}
