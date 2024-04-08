import 'package:eventbooking/provider/viewprovidereventdetails.dart';
import 'package:flutter/material.dart';

class ProviderEvent extends StatefulWidget {
  const ProviderEvent({super.key});

  @override
  State<ProviderEvent> createState() => _ProviderEventState();
}

class _ProviderEventState extends State<ProviderEvent> {
  List<dynamic> prviderEventList = ["event1","event2"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffBF3B53),
        title: const Text(
          " MY EVENT",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "League Spartan",
              fontSize: 20),
        ),
        actions: [
          Image.asset(
            "assets/images/provider/add.png",
            color: Colors.white,
            // height: 25,
            cacheHeight: 25,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: prviderEventList.length,
        itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProviderEventDetails(),));
          },
          child: Container(
            margin: const EdgeInsets.all(15),
            height: 225,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: .5,
                  ),
                ],
                border: Border.all(color: const Color(0xffE1E1E1)),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/venue1.png",
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: const Text(
                    "Pramukh Event & Decoration",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3F3F3F),
                        fontFamily: "League Spartan"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Admor",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "League Spartan",
                            fontWeight: FontWeight.w400,
                            color: Color(0xff757575)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "\$1200-2000",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "League Spartan",
                            fontWeight: FontWeight.w400,
                            color: Color(0xffBF3B53)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },)
    );
  }
}
