import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventbooking/profile.dart';
import 'package:eventbooking/registration.dart';
import 'package:eventbooking/viewdetails.dart';
import 'package:flutter/material.dart';

import 'Constant/var.dart';
import 'Constant/var2.dart';
import 'favourite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> banner = [
    "assets/images/banner.png",
    "assets/images/banner.png",
    "assets/images/banner.png"
  ];
  var pageIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          backgroundColor: const Color(0xffBF3B53),
          title: Row(
            children: [
              const Icon(Icons.location_on_outlined),
              const SizedBox(
                width: 10,
              ),
              Text(
                  CustomVariable2.cityController.text,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
            ],
          ),
          actions: [
            Image.asset(
              "assets/images/ic_search.png",
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Favourite(),
                    ));
              },
              child: Image.asset(
                "assets/images/ic_like.png",
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        drawer: Drawer(
          width: MediaQuery
              .of(context)
              .size
              .width * .85,
          child: ListView(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Image.asset("assets/images/drawer_container.png"),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image.asset(
                        "assets/images/user2_drawer.png",
                        height: 130,
                      ),
                      Positioned(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Profile(),
                                ));
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              "assets/images/profile_change.png",
                              height: 30,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Center(
                child: Text(
                  CustomVariable.nameController.text,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Kanit",
                      color: Color(0xff556080)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/location_drawer.png",
                    height: 16.25,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    CustomVariable2.cityController.text,

                    // "Gujrat",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Kanit",
                        color: Color(0xff556080)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/drawer_setting.png",
                      height: 30,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    drawerText(text: "My Event")
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 14.98,
                endIndent: 14.98,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/drawer_setting.png",
                      height: 30,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    drawerText(text: "Setting")
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 14.98,
                endIndent: 14.98,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/drawer_moreapp.png",
                      height: 30,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    drawerText(text: "More App")
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 14.98,
                endIndent: 14.98,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/drawer_share.png",
                      height: 30,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    drawerText(text: "Share")
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 14.98,
                endIndent: 14.98,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actionsPadding: const EdgeInsets.all(15),
                          title: const Text("Confirmation"),
                          content: const Text(
                            "Are you sure you want to log out ?",
                            style: TextStyle(
                                fontFamily: "Kanit",
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                                color: Color(0xff696969)),
                          ),
                          actions: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 47,
                                // width: MediaQuery.of(context).size.width*.25,
                                width: 109,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFFCDD6),
                                    borderRadius: BorderRadius.circular(3)),
                                child: const Center(
                                  child: Text(
                                    "No",
                                    style: TextStyle(
                                        fontFamily: "Kanit",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Color(0xffBF3B53)),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Registration(),
                                    ));
                              },
                              child: Container(
                                height: 47,
                                // width: MediaQuery.of(context).size.width*.25,
                                width: 109,
                                decoration: BoxDecoration(
                                    color: const Color(0xffBF3B53),
                                    borderRadius: BorderRadius.circular(3)),
                                child: const Center(
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                        fontFamily: "Kanit",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/drawer_logout.png",
                        height: 30,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      drawerText(text: "Log Out")
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 14.98,
                endIndent: 14.98,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CarouselSlider.builder(
                    itemCount: banner.length,
                    options: CarouselOptions(
                      height: 180.0,
                      autoPlay: true,
                      viewportFraction: 1,

                      // onScrolled: (value) {
                      //   pageIndex = value;
                      // },
                      onPageChanged: (index, reason) {
                        pageIndex = index;
                        debugPrint(pageIndex.toString());
                        setState(() {});
                      },
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          banner[index],
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          fit: BoxFit.fill,
                          height: 117,
                        ),
                      );
                    },
                  ),
                  CarouselIndicator(
                    height: 10,
                    width: 10,
                    count: 3,
                    index: pageIndex,
                    activeColor: const Color(0xff863342),
                    color: const Color(0xff863342).withOpacity(.5),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Best Event Venues By City",
                  style: TextStyle(
                      color: Color(0xff863342),
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: "Poppins"),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                height: 125,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: Image.asset(
                                "assets/images/bestevent.png",
                                fit: BoxFit.cover,
                                height: 100,
                              )),
                          const Text(
                            "Surat",
                            style: TextStyle(
                                color: Color(0xff5B5B5B),
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                    itemCount: 6),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Event Venues By Type",
                  style: TextStyle(
                      color: Color(0xff863342),
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: "Poppins"),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Container(
                    height: 150,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Image.asset(
                                "assets/images/eventvenue.png",
                                height: 120,
                              ),
                              const Text(
                                "Hall",
                                style: TextStyle(
                                    color: Color(0xff5B5B5B),
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 15,
                          );
                        },
                        itemCount: 6),
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Best Event Venues in Surat",
                      style: TextStyle(
                          color: Color(0xff863342),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          fontFamily: "Poppins"),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ViewDetails(),
                            ));
                      },
                      child: Image.asset(
                        "assets/images/setting.png",
                        height: 20,
                      ),
                    )
                  ],
                ),
              ),
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
                      padding:
                      const EdgeInsets.only(left: 15, top: 15, right: 15),
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
                      padding:
                      const EdgeInsets.only(left: 15, right: 15, top: 5),
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
                      padding:
                      const EdgeInsets.only(left: 15, right: 15, top: 9),
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
                height: 25,
              ),
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
                      "assets/images/babyshower.png",
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 15, top: 15, right: 15),
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
                      padding:
                      const EdgeInsets.only(left: 15, right: 15, top: 5),
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
                      padding:
                      const EdgeInsets.only(left: 15, right: 15, top: 9),
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
                height: 25,
              ),
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
                      "assets/images/happybirthday.png",
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 15, top: 15, right: 15),
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
                      padding:
                      const EdgeInsets.only(left: 15, right: 15, top: 5),
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
                      padding:
                      const EdgeInsets.only(left: 15, right: 15, top: 9),
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
                height: 25,
              ),
            ],
          ),
        ));
  }

  Widget drawerText({text}) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 22,
          fontFamily: "Kanit",
          fontWeight: FontWeight.w400,
          color: Color(0xff556080)),
    );
  }
}
