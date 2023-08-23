// To parse this JSON data, do
//
//     final getVideos = getVideosFromJson(jsonString);

import 'dart:convert';

GetVideos getVideosFromJson(String str) => GetVideos.fromJson(json.decode(str));

String getVideosToJson(GetVideos data) => json.encode(data.toJson());



class GetVideos {
  bool? status;
  List<VideoDataModel>? data;
  String? message;

  GetVideos({this.status, this.data, this.message});

  GetVideos.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <VideoDataModel>[];
      json['data'].forEach((v) {
        data!.add(new VideoDataModel.fromJson(v));
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

class VideoDataModel {
  int? id;
  String? title;
  String? thumbnail;
  String? link;
  String? module;
  String? createdAt;
  String? updatedAt;

  VideoDataModel(
      {this.id,
        this.title,
        this.thumbnail,
        this.link,
        this.module,
        this.createdAt,
        this.updatedAt});

  VideoDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    link = json['link'];
    module = json['module'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['link'] = this.link;
    data['module'] = this.module;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
