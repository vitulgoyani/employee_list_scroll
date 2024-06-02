// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

List<EmployeeModel> employeeModelFromJson(String str) => List<EmployeeModel>.from(json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeModel {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;

  EmployeeModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "address": address?.toJson(),
  };
}

class Address {
  final String? street;
  final String? city;
  final String? state;
  final String? zipcode;

  Address({
    this.street,
    this.city,
    this.state,
    this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    city: json["city"],
    state: json["state"],
    zipcode: json["zipcode"],
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "city": city,
    "state": state,
    "zipcode": zipcode,
  };
}
