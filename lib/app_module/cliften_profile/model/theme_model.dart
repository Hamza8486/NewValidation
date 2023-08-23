// To parse this JSON data, do
//
//     final themeList = themeListFromJson(jsonString);

import 'dart:convert';

ThemeList themeListFromJson(String str) => ThemeList.fromJson(json.decode(str));

String themeListToJson(ThemeList data) => json.encode(data.toJson());



class ThemeList {
  bool? status;
  List<ThemeDataModel>? data;
  String? message;

  ThemeList({this.status, this.data, this.message});

  ThemeList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ThemeDataModel>[];
      json['data'].forEach((v) {
        data!.add(new ThemeDataModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class ThemeDataModel {
  int? id;
  String? domain;
  String? color;
  String? createdAt;
  String? updatedAt;
  List<ThemesModel>? themes;

  ThemeDataModel(
      {this.id,
        this.domain,
        this.color,
        this.createdAt,
        this.updatedAt,
        this.themes});

  ThemeDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    domain = json['domain'];
    color = json['color'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['themes'] != null) {
      themes = <ThemesModel>[];
      json['themes'].forEach((v) {
        themes!.add(new ThemesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['domain'] = this.domain;
    data['color'] = this.color;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.themes != null) {
      data['themes'] = this.themes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ThemesModel {
  int? id;
  String? theme;
  String? domainId;
  String? createdAt;
  String? updatedAt;

  ThemesModel({this.id, this.theme, this.domainId, this.createdAt, this.updatedAt});

  ThemesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    theme = json['theme'];
    domainId = json['domain_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['theme'] = this.theme;
    data['domain_id'] = this.domainId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
