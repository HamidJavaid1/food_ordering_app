class Credential {
  final Authtype type;
  final String? name;
  final String email;
  final String? password;
  Credential(
      {required this.type, this.name, required this.email, this.password});
}

enum Authtype { email, google }
