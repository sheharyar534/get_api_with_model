

import 'package:flutter/material.dart';
import 'package:history_api/screens/history_screen.dart';

class FisrtPage extends StatefulWidget {
  const FisrtPage({super.key});

  @override
  State<FisrtPage> createState() => _FisrtPageState();
}

class _FisrtPageState extends State<FisrtPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: Column(
          children: [
            const Text(
              "Rider History",
              style: TextStyle(fontSize: 35),
            ),
            ElevatedButton(
              child:const  Text("History"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HistoryScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}