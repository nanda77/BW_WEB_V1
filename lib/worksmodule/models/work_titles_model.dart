// To parse this JSON data, do
//
//     final WorkTitlesModel = WorkTitlesFromJson(jsonString);

// List<Product> productFromJson(String str) =>
//     List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

// String productToJson(List<Product> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

import 'dart:convert';

List<WorkTitlesModel> workTitlesFromJson(String str) =>
    List<WorkTitlesModel>.from(
        json.decode(str).map((x) => WorkTitlesModel.fromJson(x)));

// String workTitlesToJson(List<WorkTitlesModel> data) => json.encode(data.toJson());
String workTitlesToJson(List<WorkTitlesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkTitlesModel {
  WorkTitlesModel({
    this.statuscode,
    this.statusMessage,
    this.data,
  });

  int statuscode;
  String statusMessage;
  List<Datum> data;

  factory WorkTitlesModel.fromJson(Map<String, dynamic> json) =>
      WorkTitlesModel(
        statuscode: json["statuscode"],
        statusMessage: json["statusMessage"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "statusMessage": statusMessage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.workId,
    this.name,
    this.startDatePlan,
    this.endDatePlan,
    this.dateStarted,
    this.dateEnded,
    this.projectProgress,
  });

  String workId;
  String name;
  String startDatePlan;
  String endDatePlan;
  String dateStarted;
  String dateEnded;
  int projectProgress;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        workId: json["work_id"],
        name: json["name"],
        startDatePlan: json["start_date_plan"],
        endDatePlan: json["end_date_plan"],
        dateStarted: json["date_started"],
        dateEnded: json["date_ended"],
        projectProgress: json["project_progress"],
      );

  Map<String, dynamic> toJson() => {
        "work_id": workId,
        "name": name,
        "start_date_plan": startDatePlan,
        "end_date_plan": endDatePlan,
        "date_started": dateStarted,
        "date_ended": dateEnded,
        "project_progress": projectProgress,
      };
}

// demo data

class WorksDemo {
  String workId;
  String name;
  String startDatePlan;
  String endDatePlan;
  String dateStarted;
  String dateEnded;
  int projectProgress;
  String body;

  WorksDemo({
    this.workId,
    this.name,
    this.startDatePlan,
    this.endDatePlan,
    this.dateStarted,
    this.dateEnded,
    this.projectProgress,
    this.body,
  });
}

List<WorksDemo> worksDemo = List.generate(
  json_demo.length,
  (index) => WorksDemo(
    workId: json_demo[index]["work_id"],
    name: json_demo[index]["name"],
    startDatePlan: json_demo[index]["start_date_plan"],
    endDatePlan: json_demo[index]["end_date_plan"],
    dateStarted: json_demo[index]["date_started"],
    dateEnded: json_demo[index]["date_ended"],
    projectProgress: json_demo[index]["project_progress"],
    body: workDemoText,
  ),
);

List json_demo = [
  // {
  //   "statuscode": 1,
  //   "statusMessage": "Found, project work details",
  //   "data": [
  {
    "work_id": "a8762fdb5d7bf561b832a358c22e9994",
    "name": "N V \/Slab\/Floor 1\/ Unit A",
    "start_date_plan": "2021\/1\/19",
    "end_date_plan": "2021\/1\/29",
    "date_started": "2021\/1\/18",
    "date_ended": "2021\/6\/24",
    "project_progress": 91
  },
  {
    "work_id": "0da673d0f0b4a9879189dd152135daa6",
    "name": "N V \/Slab\/Floor 1\/ Unit B",
    "start_date_plan": "",
    "end_date_plan": "",
    "date_started": "",
    "date_ended": "",
    "project_progress": 0
  },
  {
    "work_id": "5c0df96dec733f156a01f554524cb4db",
    "name": "N V \/Slab\/Floor 2\/ Unit A",
    "start_date_plan": "2021\/1\/30",
    "end_date_plan": "2021\/2\/1",
    "date_started": "",
    "date_ended": "",
    "project_progress": 20
  },
  {
    "work_id": "cbd86a5a3d4f5ca8b0347df0002baab0",
    "name": "NV\/Slab\/ work1.oo",
    "start_date_plan": "",
    "end_date_plan": "",
    "date_started": "",
    "date_ended": "",
    "project_progress": 28
  },
  {
    "work_id": "677025f16c7887de5786c0ced7c1f5ea",
    "name": "NV\/Slab\/Floor 2\/ Unit A",
    "start_date_plan": "",
    "end_date_plan": "",
    "date_started": "",
    "date_ended": "",
    "project_progress": 0
  }
  //   ]
  // }
];

String workDemoText =
    "Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed";
