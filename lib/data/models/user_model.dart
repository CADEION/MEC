// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    bool? success;
    Data? data;
    String? message;

    UserModel({
        this.success,
        this.data,
        this.message,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
    };
}

class Data {
    String? fullName;
    String? email;
    String? password;
    String? phoneNumber;
    String? address;
    String? city;
    String? state;
    int? profileProgress;
    String? id;
    String? dataId;
    DateTime? updatedOn;
    DateTime? createdOn;
    int? v;

    Data({
        this.fullName,
        this.email,
        this.password,
        this.phoneNumber,
        this.address,
        this.city,
        this.state,
        this.profileProgress,
        this.id,
        this.dataId,
        this.updatedOn,
        this.createdOn,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        fullName: json["fullName"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        profileProgress: json["profileProgress"],
        id: json["_id"],
        dataId: json["id"],
        updatedOn: json["updatedOn"] == null ? null : DateTime.parse(json["updatedOn"]),
        createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "address": address,
        "city": city,
        "state": state,
        "profileProgress": profileProgress,
        "_id": id,
        "id": dataId,
        "updatedOn": updatedOn?.toIso8601String(),
        "createdOn": createdOn?.toIso8601String(),
        "__v": v,
    };
}
