

import 'dart:convert';

HistoryModel historyModelFromJson(String str){
return HistoryModel.fromjson(jsonDecode(str));
}

class HistoryModel {
  final int status;
  final List<HistoryDataModel> data;
  HistoryModel({required this.status, required this.data});
  factory HistoryModel.fromjson(Map<String, dynamic> json) {
    return HistoryModel(
      status: json["status"],
      data: List<HistoryDataModel>.from(
        json["data"].map((x) => HistoryDataModel.fromjson(x)),
      )
    );
  }
}

class HistoryDataModel {
  final String? pickuplocation;
  final String? droplocation;
  final double? distance;
  final double? farePrice;

  HistoryDataModel(
      {required this.pickuplocation,required this.droplocation,required this.distance, this.farePrice});

  //from json
  factory HistoryDataModel.fromjson(Map<String, dynamic> json) {
    return HistoryDataModel(
      pickuplocation: json["pickup_location"],
      droplocation: json['drop_location'],
      distance: json['distance'],
      farePrice: json['fare_price'],
    );
  }
}
