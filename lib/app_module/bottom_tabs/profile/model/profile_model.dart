import 'dart:convert';

GetProfileResponse getProfileResponseFromJson(String str) => GetProfileResponse.fromJson(json.decode(str));

String getProfileResponseToJson(GetProfileResponse data) => json.encode(data.toJson());




class GetProfileResponse {
  bool? status;
  ProfileData? data;
  String? message;

  GetProfileResponse({this.status, this.data, this.message});

  GetProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class ProfileData {
  int? id;
  String? name;
  String? username;
  String? email;
  var emailVerifiedAt;
  String? familyName;
  String? companyName;
  String? image;
  int? status;
  int? isAdmin;
  int? isCSP;
  int? isM;
  String? lastLogin;
  String? createdAt;
  String? updatedAt;
  List<CliftonStrengthsProfile>? cliftonStrengthsProfile;

  ProfileData(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.emailVerifiedAt,
        this.familyName,
        this.companyName,
        this.image,
        this.status,
        this.isAdmin,
        this.isCSP,
        this.isM,
        this.lastLogin,
        this.createdAt,
        this.updatedAt,
        this.cliftonStrengthsProfile});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name']??"";
    username = json['username']??"";
    email = json['email']??"";
    emailVerifiedAt = json['email_verified_at'];
    familyName = json['family_name']??"";
    companyName = json['company_name']??"";
    image = json['image']??"";
    status = json['status']??0;
    isAdmin = json['is_admin']??0;
    isCSP = json['is_CSP']??0;
    isM = json['is_M']??0;
    lastLogin = json['last_login']??"";
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    if (json['clifton_strengths_profile'] != null) {
      cliftonStrengthsProfile = <CliftonStrengthsProfile>[];
      json['clifton_strengths_profile'].forEach((v) {
        cliftonStrengthsProfile!.add(new CliftonStrengthsProfile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['family_name'] = this.familyName;
    data['company_name'] = this.companyName;
    data['image'] = this.image;
    data['status'] = this.status;
    data['is_admin'] = this.isAdmin;
    data['is_CSP'] = this.isCSP;
    data['is_M'] = this.isM;
    data['last_login'] = this.lastLogin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.cliftonStrengthsProfile != null) {
      data['clifton_strengths_profile'] =
          this.cliftonStrengthsProfile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CliftonStrengthsProfile {
  int? id;
  String? theme;
  int? domainId;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  CliftonStrengthsProfile(
      {this.id,
        this.theme,
        this.domainId,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  CliftonStrengthsProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    theme = json['theme'];
    domainId = json['domain_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['theme'] = this.theme;
    data['domain_id'] = this.domainId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? themeId;

  Pivot({this.userId, this.themeId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    themeId = json['theme_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['theme_id'] = this.themeId;
    return data;
  }
}
