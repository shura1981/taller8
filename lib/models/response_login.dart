// To parse this JSON data, do
//
//     final responseLogin = responseLoginFromJson(jsonString);

import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) => ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
    String message;
    bool status;
    Data data;

    ResponseLogin({
        required this.message,
        required this.status,
        required this.data,
    });

    factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        message: json["message"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    DateTime createdAt;
    String updatedAt;
    String deletedAt;
    String name;
    String email;
    int phone;
    String role;
    String jsontoken;

    Data({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.name,
        required this.email,
        required this.phone,
        required this.role,
        required this.jsontoken,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        role: json["role"],
        jsontoken: json["jsontoken"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "name": name,
        "email": email,
        "phone": phone,
        "role": role,
        "jsontoken": jsontoken,
    };
}
