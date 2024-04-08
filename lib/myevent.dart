import 'package:eventbooking/upcoming.dart';
import 'package:flutter/material.dart';

class MyEvent extends StatefulWidget {
  const MyEvent({super.key});

  @override
  State<MyEvent> createState() => _MyEventState();
}

class _MyEventState extends State<MyEvent> with TickerProviderStateMixin {
  String selectedEvents = "Upcoming";

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery
              .of(context)
              .size
              .width, 120),
          child: Column(
            children: [
              AppBar(
                backgroundColor: const Color(0xffBF3B53),
                title: const Text(
                  " MY EVENT",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "League Spartan",
                      fontSize: 20),
                ),
              ),
              TabBar(
                  controller: _tabController,
                  // dividerColor: Colors.black,
                  labelColor: const Color(0xffBF3B53),
                  unselectedLabelColor: const Color(0xffA5A5A5),
                  indicatorColor: const Color(0xffBF3B53),
                  labelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Kanit"),
                  tabs: const [
                    Tab(
                      text: "Upcoming",
                    ),
                    Tab(
                      text: "Completed",
                    ),
                    Tab(
                      text: "Cencelled",
                    )
                  ]),
              const Divider(
                height: 1,
                thickness: 2,
              )
            ],
          ),
        ),
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const Upcoming(),));
                },
                child: Column(
                  children: [
                    Container(
                      // height: 259,
                      margin: const EdgeInsets.only(right: 15, left: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              spreadRadius: 2,
                            ),
                          ],
                          border: Border.all(color: const Color(0xffE1E1E1)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/venue1.png",
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Pramukh Event & Decoration",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff3F3F3F),
                                      fontFamily: "League Spartan"),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/Star 1.png",
                                      cacheHeight: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      "4.1",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff3F3F3F),
                                          fontFamily: "Poppins"),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Vector (1).png",
                                  height: 12.19,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "Admor",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "League Spartan",
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff757575)),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "\$ 1200-2000 ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "League Spartan",
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffBF3B53)),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "See Profile",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "League Spartan",
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffBF3B53)),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      "assets/images/arrow.png",
                                      height: 12.28,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15, left: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              spreadRadius: 2,
                            ),
                          ],
                          border: Border.all(color: const Color(0xffE1E1E1)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/venue1.png",
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Pramukh Event & Decoration",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff3F3F3F),
                                      fontFamily: "League Spartan"),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/Star 1.png",
                                      cacheHeight: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      "4.1",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff3F3F3F),
                                          fontFamily: "Poppins"),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Vector (1).png",
                                  height: 12.19,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "Admor",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "League Spartan",
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff757575)),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "\$ 1200-2000 ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "League Spartan",
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffBF3B53)),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "See Profile",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "League Spartan",
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffBF3B53)),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      "assets/images/arrow.png",
                                      height: 12.28,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 15, left: 15),
                    height: 259,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            spreadRadius: 2,
                          ),
                        ],
                        border: Border.all(color: const Color(0xffE1E1E1)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/venue1.png",
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Pramukh Event & Decoration",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff3F3F3F),
                                    fontFamily: "League Spartan"),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/Star 1.png",
                                    cacheHeight: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "4.1",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3F3F3F),
                                        fontFamily: "Poppins"),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/Vector (1).png",
                                height: 12.19,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Admor",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "League Spartan",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff757575)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 9),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "\$ 1200-2000 ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "League Spartan",
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffBF3B53)),
                              ),
                              const Spacer(),
                              Image.asset(
                                "assets/images/completed_ic.png", height: 20,),


                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 259,
                    margin: const EdgeInsets.only(right: 15, left: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            spreadRadius: 2,
                          ),
                        ],
                        border: Border.all(color: const Color(0xffE1E1E1)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/venue1.png",
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Pramukh Event & Decoration",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff3F3F3F),
                                    fontFamily: "League Spartan"),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/Star 1.png",
                                    cacheHeight: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "4.1",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3F3F3F),
                                        fontFamily: "Poppins"),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/Vector (1).png",
                                height: 12.19,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Admor",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "League Spartan",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff757575)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "\$ 1200-2000 ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "League Spartan",
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffBF3B53)),
                              ),
                              const Spacer(),
                              Image.asset(
                                "assets/images/completed_ic.png", height: 20,),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 15, left: 15),
                    height: 259,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            spreadRadius: 2,
                          ),
                        ],
                        border: Border.all(color: const Color(0xffE1E1E1)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/venue1.png",
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Pramukh Event & Decoration",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff3F3F3F),
                                    fontFamily: "League Spartan"),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/Star 1.png",
                                    cacheHeight: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "4.1",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3F3F3F),
                                        fontFamily: "Poppins"),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/Vector (1).png",
                                height: 12.19,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Admor",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "League Spartan",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff757575)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "\$ 1200-2000 ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "League Spartan",
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffBF3B53)),
                              ),
                              RichText(text: const TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Reason : ",
                                        style: TextStyle(
                                            fontFamily: "Kanit",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color(0xff3F3F3F)
                                        )
                                    ),
                                    TextSpan(
                                        text: "I just want to cencel",
                                        style: TextStyle(
                                            fontFamily: "Kanit",
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                            color: Color(0xff3F3F3F)
                                        )
                                    )
                                  ]
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 259,
                    margin: const EdgeInsets.only(right: 15, left: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            spreadRadius: 2,
                          ),
                        ],
                        border: Border.all(color: const Color(0xffE1E1E1)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/venue1.png",
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Pramukh Event & Decoration",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff3F3F3F),
                                    fontFamily: "League Spartan"),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/Star 1.png",
                                    cacheHeight: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "4.1",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3F3F3F),
                                        fontFamily: "Poppins"),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/Vector (1).png",
                                height: 12.19,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Admor",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "League Spartan",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff757575)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "\$ 1200-2000 ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "League Spartan",
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffBF3B53)),
                              ),
                              RichText(text: const TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Reason : ",
                                        style: TextStyle(
                                            fontFamily: "Kanit",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color(0xff3F3F3F)
                                        )
                                    ),
                                    TextSpan(
                                        text: "I just want to cencel",
                                        style: TextStyle(
                                            fontFamily: "Kanit",
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                            color: Color(0xff3F3F3F)
                                        )
                                    )
                                  ]
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]));
  }
}
