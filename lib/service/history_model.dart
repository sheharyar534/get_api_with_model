import 'dart:convert';

HistoryModel historyModelFromJson(String str) {
  return HistoryModel.fromjson(jsonDecode(str));
}

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  final int status;
  final List<HistoryDataModel> data;
  HistoryModel({required this.status, required this.data});

  //from json
  factory HistoryModel.fromjson(Map<String, dynamic> json) {
    return HistoryModel(
        status: json["status"],
        data: List<HistoryDataModel>.from(
          json["data"].map((x) => HistoryDataModel.fromjson(x)),
        ));
  }

  //to json
  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "data": List<dynamic>.from(data.map((x) => toJson()))
    };
  }
}

class HistoryDataModel {
  final String? pickuplocation;
  final String? droplocation;
  final double? distance;
  final double? farePrice;

  HistoryDataModel(
      {required this.pickuplocation,
      required this.droplocation,
      required this.distance,
      required this.farePrice});

  //from json method
  factory HistoryDataModel.fromjson(Map<String, dynamic> json) {
    return HistoryDataModel(
      pickuplocation: json["pickup_location"],
      droplocation: json['drop_location'],
      distance: json['distance'],
      farePrice: json['fare_price'],
    );
  }
  //to jeson
  Map<String, dynamic> toJson() => {
        "pickup_location": pickuplocation,
        "drop_location": droplocation,
        "fare_price": farePrice,
      };
}
