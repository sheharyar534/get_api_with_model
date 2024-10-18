import 'package:flutter/material.dart';

class DetailedPage extends StatelessWidget {
  final String? pickupLocation;
  final String? dropLocation;
  final double? farePrice;
  final double? rideDistance;
  const DetailedPage(
      {super.key,
      required this.dropLocation,
      required this.farePrice,
      required this.pickupLocation,
      required this.rideDistance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Pages",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15 ),
                  child: Container(
                    height: 200,
                    width: 300,
                    color: Colors.black26,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50, bottom: 50),
                  child: Container(
                    height: 200,
                    width: 300,
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("From : $pickupLocation"),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("To : $dropLocation"),
                            const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Price : Rs $farePrice",
                          ),
                            const SizedBox(
                            height: 10,
                          ),
                          Text("distance : $rideDistance Km")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
