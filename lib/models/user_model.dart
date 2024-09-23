import 'dart:convert';

// Model class
class User {
  int id;
  String firstname;
  String lastname;
  String email;
  DateTime birthDate;
  Login login;
  Address address;
  String phone;
  String website;
  Company company;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.birthDate,
    required this.login,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  // Factory constructor to parse JSON data into User object
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        birthDate: DateTime.parse(json['birthDate']),
        login: Login.fromJson(json['login']),
        address: Address.fromJson(json['address']),
        phone: json['phone'],
        website: json['website'],
        company: Company.fromJson(json['company']),
      );
}

// Login class
class Login {
  String uuid;
  String username;
  String password;
  String md5;
  String sha1;
  DateTime registered;

  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.md5,
    required this.sha1,
    required this.registered,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json['uuid'],
        username: json['username'],
        password: json['password'],
        md5: json['md5'],
        sha1: json['sha1'],
        registered: DateTime.parse(json['registered']),
      );
}

// Address class
class Address {
  String street;
  String suite;
  String city;
  String zipcode;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode'],
      );
}

// Company class
class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json['name'],
        catchPhrase: json['catchPhrase'],
        bs: json['bs'],
      );
}

// Function to parse JSON string into User object
User userFromJson(String str) => User.fromJson(json.decode(str));
