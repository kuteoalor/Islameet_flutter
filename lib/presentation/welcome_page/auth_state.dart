class AuthState {
  final int? id;
  final String? email;
  final String? name;
  final String? description;
  final String? city;
  final DateTime? birthday;
  final bool? isMale;
  final String? photoEncoded;
  final String? accessToken;
  final String? refreshToken;
  const AuthState({
    this.id,
    this.email,
    this.description,
    this.city,
    this.birthday,
    this.photoEncoded,
    this.isMale,
    this.name,
    this.accessToken,
    this.refreshToken,
  });

  factory AuthState.fromPrev({
    int? id,
    String? email,
    String? description,
    String? city,
    DateTime? birthday,
    String? photoURL,
    bool? isMale,
    String? name,
    String? accessToken,
    String? refreshToken,
    required AuthState prevState,
  }) {
    return AuthState(
      id: id ?? prevState.id,
      email: email ?? prevState.email,
      description: description ?? prevState.description,
      city: city ?? prevState.city,
      birthday: birthday ?? prevState.birthday,
      photoEncoded: photoURL ?? prevState.photoEncoded,
      isMale: isMale ?? prevState.isMale,
      name: name ?? prevState.name,
      accessToken: accessToken ?? prevState.accessToken,
      refreshToken: refreshToken ?? prevState.refreshToken,
    );
  }
}
