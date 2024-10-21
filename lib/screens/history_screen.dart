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

  void moveToDetailedPage(index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailedPage(
                dropLocation: historyData[index].droplocation,
                farePrice: historyData[index].farePrice,
                pickupLocation: historyData[index].pickuplocation,
                rideDistance: historyData[index].distance)));
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
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                  itemCount: historyData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black26)),
                      child: GestureDetector(
                        onTap: () {
                          historyData[index].status == 'COMPLETED'
                              ? moveToDetailedPage(index)
                              : null;
                        },
                        child: ListTile(
                          leading: historyData[index].status == 'COMPLETED'
                              ? CircleAvatar(
                                  radius: MediaQuery.of(context).size.height *
                                      0.023,
                                  backgroundColor: Colors.black12,
                                  child: CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      backgroundColor: Colors.white,
                                      child: const Icon(
                                        Icons.check_circle_sharp,
                                        color: Colors.green,
                                      )),
                                )
                              : CircleAvatar(
                                  radius: MediaQuery.of(context).size.height *
                                      0.023,
                                  backgroundColor: Colors.black12,
                                  child: CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      backgroundColor: Colors.white,
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      )),
                                ),
                          title: Text(
                            historyData[index].pickuplocation.toString(),
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              historyData[index].droplocation.toString(),
                              style: const TextStyle(fontSize: 10)),
                          trailing: Padding(
                            padding: const EdgeInsets.only(left: 01),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: historyData[index].status ==
                                              'COMPLETED'
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border:
                                          Border.all(color: Colors.black12)),
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text(
                                    historyData[index].status.toString(),
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  size: 33,
                                  color: Colors.black26,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user may not  tap button!
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height * 0.05,
                  backgroundColor: Colors.red,
                  child: const Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Oh Error!",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 250,
                  child: Text(
                    "WE cannot show you the detail because this ride was cancelled before it proceed further.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.055,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      "Dismiss",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
