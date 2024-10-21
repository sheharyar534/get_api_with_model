import 'package:history_api/service/history_model.dart';
import 'package:http/http.dart' as http;

class HistoryRepository {
  final _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzMwODk5NjQ3LCJpYXQiOjE3MjgzMDc2NDcsImp0aSI6IjRhMzNjN2U3MmM5ZTQ5OTVhOGQ1MDJmOTk0YzE0YTE0IiwidXNlcl9pZCI6ImFmM2VjZDA2LTMwNDAtNDZmOC04YjEyLTgwYTg4OTg1ODdkYyJ9.VbIJIq5AcRouLqWSnwFNpk6lSooBAhvJZljIK-KMsds";

  Future<List<HistoryDataModel>> getrideHistory() async {
    var response = await http.get(
        Uri.parse("http://103.245.193.89:8084/ride/trip-history/"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $_token",
        });

    if (response.statusCode == 200) {
      var data = response.body;
      List<HistoryDataModel> rideHistory = [];
      rideHistory.addAll(historyModelFromJson(data).data);
      return rideHistory;
    } else {
      return getrideHistory();
      // return [
      //   HistoryDataModel(
      //     pickuplocation: "pickup_location",
      //     droplocation: "drop_location",
      //     distance: 2.5,
      //     farePrice: 5.0,
      //   )
      // ];
    }
  }
}
