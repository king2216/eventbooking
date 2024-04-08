import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserEvent extends StatefulWidget {
  const UserEvent({super.key});

  @override
  State<UserEvent> createState() => _UserEventState();
}

class _UserEventState extends State<UserEvent> {
  List<dynamic> eventList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffBF3B53),
          title: const Text(
            "USER EVENT",
            style: TextStyle(
                fontFamily: "Kanit", fontWeight: FontWeight.w400, fontSize: 20),
          ),
        ),
        body: eventList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/provider/sad_smiley.png",
                      height: 60,
                    ),
                    SizedBox(height: 10,),
                    Text("Sorry no user has booked the event")
                  ],
                ),
              )
            : Column());
  }
}
