class User {
  final int id;
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  User(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: int.tryParse(json["id"]) ?? 0,
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
      };
}
