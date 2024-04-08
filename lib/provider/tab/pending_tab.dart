import 'package:flutter/material.dart';

class PendingTab extends StatefulWidget {
  const PendingTab({super.key});

  @override
  State<PendingTab> createState() => _PendingTabState();
}

class _PendingTabState extends State<PendingTab> {
  List<dynamic> penidngList = ["Request", "Request2","123"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: penidngList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/provider/sad_smiley.png",
                      height: 60,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Sorry no user has booked the event")
                  ],
                ),
              )
            : ListView.builder(
                itemCount: penidngList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Sunita Verma",
                                      style: TextStyle(
                                          fontFamily: "Kanit",
                                          color: Color(0xff464646),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                    ),
                                    Image.asset(
                                      "assets/images/provider/right_arrow.png",
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/images/provider/location.png",
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Surat",
                                      style: TextStyle(
                                          fontFamily: "Kanit",
                                          color: Color(0xff6D6D6D),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "23 May 2023",
                                      style: TextStyle(
                                          fontFamily: "Kanit",
                                          color: Color(0xff6D6D6D),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14),
                                    ),
                                    Text("8 Min ago",
                                        style: TextStyle(
                                            fontFamily: "Kanit",
                                            color: Color(0xff6D6D6D),
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14))
                                  ],
                                ),
                              ),
                              Divider(
                                height: 20,
                                color: Color(0xff0C6C6C6),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 38,
                                      margin: EdgeInsets.all(15),
                                      child: Center(
                                        child: Text("Rejected",
                                            style: TextStyle(
                                                fontFamily: "Kanit",
                                                color: Color(0xffBF3B53),
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12)),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffBF3B53)),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 38,
                                      margin: EdgeInsets.all(15),
                                      child: Center(
                                        child: Text("Accepted",
                                            style: TextStyle(
                                                fontFamily: "Kanit",
                                                color: Color(0xffBF3B53),
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12)),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffBF3B53)),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffC6C6C6)),
                              // color: Colors.black12,
                              borderRadius: BorderRadius.circular(3)),
                        )
                      ],
                    ),
                  );
                },
              ));
  }
}
