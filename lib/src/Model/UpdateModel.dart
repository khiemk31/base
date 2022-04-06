// To parse this JSON data, do
//
//     final updateModel = updateModelFromJson(jsonString);

import 'dart:convert';

UpdateModel updateModelFromJson(String str) => UpdateModel.fromJson(json.decode(str));

String updateModelToJson(UpdateModel data) => json.encode(data.toJson());

class UpdateModel {
  UpdateModel({
    this.error,
    this.data,
  });

  Error ?error;
  List<UpdateItemModel>? data;

  factory UpdateModel.fromJson(Map<String, dynamic> json) => UpdateModel(
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
    data: json["data"] == null ? null : List<UpdateItemModel>.from(json["data"].map((x) => UpdateItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error == null ? null : error!.toJson(),
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class UpdateItemModel {
  UpdateItemModel({
    this.id,
    this.appId,
    this.platform,
    this.version,
    this.isForceUpdate,
    this.forceVersionFrom,
    this.description,
    this.state,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? appId;
  String? platform;
  String? version;
  bool? isForceUpdate;
  dynamic forceVersionFrom;
  String ?description;
  int? state;
  DateTime? createdAt;
  DateTime ?updatedAt;

  factory UpdateItemModel.fromJson(Map<String, dynamic> json) => UpdateItemModel(
    id: json["id"],
    appId: json["appId"],
    platform: json["platform"],
    version: json["version"],
    isForceUpdate: json["isForceUpdate"],
    forceVersionFrom: json["forceVersionFrom"],
    description: json["description"],
    state: json["state"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "appId": appId,
    "platform": platform,
    "version": version,
    "isForceUpdate": isForceUpdate,
    "forceVersionFrom": forceVersionFrom,
    "description": description,
    "state": state,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}

class Error {
  Error({
    this.status,
    this.message,
  });

  bool ?status;
  String? message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
