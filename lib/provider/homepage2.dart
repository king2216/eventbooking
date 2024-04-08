import 'dart:io';

import 'package:eventbooking/login.dart';
import 'package:eventbooking/provider/addevent.dart';
import 'package:eventbooking/provider/provider_event.dart';
import 'package:eventbooking/provider/tab/cencelled_tab.dart';
import 'package:eventbooking/provider/tab/completed_tab.dart';
import 'package:eventbooking/provider/tab/pending_tab.dart';
import 'package:eventbooking/provider/tab/upcoming_tab.dart';
import 'package:eventbooking/provider/userevent.dart';
import 'package:eventbooking/registration.dart';
import 'package:flutter/material.dart';

import '../Constant/var.dart';
import '../Constant/var2.dart';
import '../profile.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2>
    with SingleTickerProviderStateMixin {
  List<Widget> listOfWidget = [
    PendingTab(),
    UpComingTab(),
    CompletedTab(),
    CencelledTab()
  ];

  int selectPage = 0;
  late TabController tabController;
  String? profilePic;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 120),
        child: Column(
          children: [
            AppBar(
              title: Text(
                "EVENT SERVICER",
                style: TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              leading: InkWell(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  child: Icon(Icons.menu)),
              backgroundColor: Color(0xffBF3B53),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEvent(),
                        ));
                  },
                  child: Image.asset(
                    "assets/images/provider/add.png",
                    color: Colors.white,
                    // height: 25,
                    cacheHeight: 25,
                  ),
                )
              ],
            ),
            TabBar(
                isScrollable: true,
                controller: tabController,
                // dividerColor: Colors.black,
                labelColor: const Color(0xffBF3B53),
                unselectedLabelColor: const Color(0xffA5A5A5),
                indicatorColor: const Color(0xffBF3B53),
                onTap: (val) {
                  selectPage = val;
                  setState(() {});
                },
                labelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit"),
                tabs: const [
                  Tab(
                    text: "Pending",
                  ),
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
          ],
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * .85,
        child: ListView(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image.asset("assets/images/drawer_container.png"),
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    profilePic == null
                        ? Image.asset(
                            "assets/images/user2_drawer.png",
                            height: 130,
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.blue, shape: BoxShape.circle),
                            child: ClipOval(
                                child: SizedBox.fromSize(
                                    size: Size.fromRadius(100),
                                    child: Image.file(
                                      File(profilePic!),
                                      fit: BoxFit.cover,
                                    )))),
                    Positioned(
                      child: InkWell(
                        onTap: () async {
                          String? result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  Profile(imgPath: profilePic??""),
                              ));
                          if (result != null) {
                            profilePic = result;
                            setState(() {});
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: InkWell(
                            child: Image.asset(
                              "assets/images/profile_change.png",
                              height: 30,
                            ),
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Image.asset(
            //       "assets/images/location_drawer.png",
            //       height: 16.25,
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     Text(
            //       CustomVariable2.cityController.text,
            //
            //       // "Gujrat",
            //       style: const TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.w300,
            //           fontFamily: "Kanit",
            //           color: Color(0xff556080)),
            //     )
            //   ],
            // ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProviderEvent(),
                      ));
                },
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserEvent(),
                      ));
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/provider/user_event.png",
                      height: 30,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    drawerText(text: "User Event")
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
      body: listOfWidget.elementAt(selectPage),
    );
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
