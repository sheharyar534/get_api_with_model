import 'package:flutter/material.dart';
import 'package:history_api/screens/detailed_page.dart';
import 'package:history_api/service/history_model.dart';
import 'package:history_api/service/history_rep.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<HistoryDataModel> historyData = [];

  HistoryRepository historyRepository = HistoryRepository();

  getHistory() async {
    historyData = await historyRepository.getrideHistory();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ride history Api"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Rider History",
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              height: 650,
              child: ListView.builder(
                  itemCount: historyData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailedPage(
                            dropLocation: historyData[index].droplocation,
                            pickupLocation: historyData[index].pickuplocation,
                            rideDistance: historyData[index].distance,
                            farePrice: historyData[index].farePrice,
                          );
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:const  BorderRadius.all(Radius.circular(10)),
                            border: Border(
                                top: index == 0
                                    ? const BorderSide(color: Colors.black)
                                    : BorderSide.none,
                                bottom: const BorderSide(color: Colors.black),
                                left: const BorderSide(color: Colors.black),
                                right: const BorderSide(color: Colors.black))),
                        child: ListTile(
                          title: Text(
                              historyData[index].pickuplocation.toString()),
                          subtitle:
                              Text(historyData[index].droplocation.toString()),
                          trailing: Column(
                            children: [
                              Text(
                                  "${historyData[index].distance.toString()} km"),
                              Text(
                                  " Rs: ${historyData[index].farePrice.toString()}"),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
