// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'dart:ui';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.statuscode,
    this.statusMessage,
    this.data,
  });

  int statuscode;
  String statusMessage;
  Data data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        statuscode: json["statuscode"],
        statusMessage: json["statusMessage"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "statusMessage": statusMessage,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.posts,
    this.snags,
    this.materials,
    this.postAssets,
    this.subscription,
    this.signatureUrl,
  });

  List<dynamic> posts;
  List<Snag> snags;
  List<dynamic> materials;
  List<PostAsset> postAssets;
  String subscription;
  String signatureUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        posts: List<dynamic>.from(json["posts"].map((x) => x)),
        snags: List<Snag>.from(json["snags"].map((x) => Snag.fromJson(x))),
        materials: List<dynamic>.from(json["materials"].map((x) => x)),
        postAssets: List<PostAsset>.from(
            json["post_assets"].map((x) => PostAsset.fromJson(x))),
        subscription: json["subscription"],
        signatureUrl: json["signature_url"],
      );

  Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts.map((x) => x)),
        "snags": List<dynamic>.from(snags.map((x) => x.toJson())),
        "materials": List<dynamic>.from(materials.map((x) => x)),
        "post_assets": List<dynamic>.from(postAssets.map((x) => x.toJson())),
        "subscription": subscription,
        "signature_url": signatureUrl,
      };
}

class PostAsset {
  PostAsset({
    this.filePath,
    this.type,
  });

  String filePath;
  String type;

  factory PostAsset.fromJson(Map<String, dynamic> json) => PostAsset(
        filePath: json["file_path"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "file_path": filePath,
        "type": type,
      };
}

class Snag {
  Snag({
    this.postId,
    this.workName,
    this.notes,
    this.progress,
    this.noWorkers,
    this.isIssue,
    this.updatesDate,
    this.updatesTime,
    this.updatedAt,
    this.updatesAssets,
    this.startDatePlan,
    this.endDatePlan,
    this.dateStarted,
    this.dateEnded,
    this.totalProgress,
  });

  String postId;
  String workName;
  String notes;
  int progress;
  String noWorkers;
  String isIssue;
  String updatesDate;
  String updatesTime;
  DateTime updatedAt;
  List<UpdatesAsset> updatesAssets;
  String startDatePlan;
  String endDatePlan;
  String dateStarted;
  String dateEnded;
  int totalProgress;

  factory Snag.fromJson(Map<String, dynamic> json) => Snag(
        postId: json["post_id"],
        workName: json["work_name"],
        notes: json["notes"] == null ? null : json["notes"],
        progress: json["progress"],
        noWorkers: json["no_workers"],
        isIssue: json["is_issue"],
        updatesDate: json["updates_date"],
        updatesTime: json["updates_time"],
        updatedAt: DateTime.parse(json["updated_at"]),
        updatesAssets: List<UpdatesAsset>.from(
            json["updates_assets"].map((x) => UpdatesAsset.fromJson(x))),
        startDatePlan: json["start_date_plan"],
        endDatePlan: json["end_date_plan"],
        dateStarted: json["date_started"],
        dateEnded: json["date_ended"],
        totalProgress: json["total_progress"],
      );

  Map<String, dynamic> toJson() => {
        "post_id": postId,
        "work_name": workName,
        "notes": notes == null ? null : notes,
        "progress": progress,
        "no_workers": noWorkers,
        "is_issue": isIssue,
        "updates_date": updatesDate,
        "updates_time": updatesTime,
        "updated_at": updatedAt.toIso8601String(),
        "updates_assets":
            List<dynamic>.from(updatesAssets.map((x) => x.toJson())),
        "start_date_plan": startDatePlan,
        "end_date_plan": endDatePlan,
        "date_started": dateStarted,
        "date_ended": dateEnded,
        "total_progress": totalProgress,
      };
}

class UpdatesAsset {
  UpdatesAsset({
    this.id,
    this.filePath,
    this.type,
    this.useridApproved,
    this.approvedName,
    this.updatedTimestamp,
  });

  String id;
  String filePath;
  String type;
  String useridApproved;
  String approvedName;
  DateTime updatedTimestamp;

  factory UpdatesAsset.fromJson(Map<String, dynamic> json) => UpdatesAsset(
        id: json["id"],
        filePath: json["file_path"],
        type: json["type"],
        useridApproved: json["userid_approved"],
        approvedName: json["approved_name"],
        updatedTimestamp: DateTime.parse(json["updated_timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file_path": filePath,
        "type": type,
        "userid_approved": useridApproved,
        "approved_name": approvedName,
        "updated_timestamp": updatedTimestamp.toIso8601String(),
      };
}

List<Map<String, Object>> json = [
  {
    "statuscode": 1,
    "statusMessage": "report response list",
    "data": {
      "posts": [],
      "snags": [
        {
          "post_id": "58007ce3c2f5022fb474777e52c26bdb",
          "work_name": "N V \/Slab\/Floor 1\/ Unit A",
          "notes": "Issue test",
          "progress": 0,
          "no_workers": "0",
          "is_issue": "1",
          "updates_date": "02 Aug 21",
          "updates_time": "01:25 pm",
          "updated_at": "2021-08-12 05:44:00",
          "updates_assets": [
            {
              "id": "2035",
              "file_path":
                  "https:\/\/res.cloudinary.com\/nearlet\/image\/upload\/r_14\/v1608534369\/buildn\/image_20210801_1742340",
              "type": "JPG",
              "userid_approved": "",
              "approved_name": "",
              "updated_timestamp": "2021-08-01 12:12:36"
            }
          ],
          "start_date_plan": "2021\/1\/19",
          "end_date_plan": "2021\/1\/29",
          "date_started": "2021\/1\/18",
          "date_ended": "2021\/6\/24",
          "total_progress": 91
        },
        {
          "post_id": "f57a381beb3213ff66da62296128c827",
          "work_name": "NV\/Brick Work\/1",
          "notes": null,
          "progress": 0,
          "no_workers": "0",
          "is_issue": "2",
          "updates_date": "02 Aug 21",
          "updates_time": "06:28 pm",
          "updated_at": "2021-08-04 11:11:00",
          "updates_assets": [
            {
              "id": "2047",
              "file_path":
                  "https:\/\/res.cloudinary.com\/nearlet\/image\/upload\/r_14\/v1608534369\/buildn\/Image_20210802_182800",
              "type": "JPG",
              "userid_approved": "",
              "approved_name": "",
              "updated_timestamp": "2021-08-02 12:58:00"
            }
          ],
          "start_date_plan": "",
          "end_date_plan": "",
          "date_started": "",
          "date_ended": "",
          "total_progress": 25
        }
      ],
      "materials": [],
      "post_assets": [
        {
          "file_path":
              "https:\/\/res.cloudinary.com\/nearlet\/image\/upload\/r_14\/v1608534369\/buildn\/image_20210801_1742340",
          "type": "JPG"
        },
        {
          "file_path":
              "https:\/\/res.cloudinary.com\/nearlet\/image\/upload\/r_14\/v1608534369\/buildn\/Image_20210802_182800",
          "type": "JPG"
        }
      ],
      "subscription": "FREE",
      "signature_url": ""
    }
  }
];









//


