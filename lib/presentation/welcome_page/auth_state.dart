class AuthState {
  final int? id;
  final String? email;
  final String? name;
  final String? description;
  final String? city;
  final DateTime? birthday;
  final bool? isMale;
  final String? photoURL;
  const AuthState(
      {this.id,
      this.email,
      this.description,
      this.city,
      this.birthday,
      this.photoURL,
      this.isMale,
      this.name});

  factory AuthState.fromPrev({
    int? id,
    String? email,
    String? description,
    String? city,
    DateTime? birthday,
    String? photoURL,
    bool? isMale,
    String? name,
    required AuthState prevState,
  }) {
    return AuthState(
        id: id ?? prevState.id,
        email: email ?? prevState.email,
        description: description ?? prevState.description,
        city: city ?? prevState.city,
        birthday: birthday ?? prevState.birthday,
        photoURL: photoURL ?? prevState.photoURL,
        isMale: isMale ?? prevState.isMale,
        name: name ?? prevState.name);
  }
}
