import 'package:eventbooking/provider/addevent.dart';
import 'package:flutter/material.dart';

class UpComingTab extends StatefulWidget {
  const UpComingTab({super.key});

  @override
  State<UpComingTab> createState() => _UpComingTabState();
}

class _UpComingTabState extends State<UpComingTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddEvent(),));
              },
              child: Image.asset(
                "assets/images/provider/event_servicer.png",
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
