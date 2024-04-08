import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'editproviderevent.dart';

class ViewProviderEventDetails extends StatefulWidget {
  const ViewProviderEventDetails({super.key});

  @override
  State<ViewProviderEventDetails> createState() =>
      _ViewProviderEventDetailsState();
}

class _ViewProviderEventDetailsState extends State<ViewProviderEventDetails> {
  List<String> eventBanner = [
    "assets/images/viewdetails_page_birthday_1.png",
    "assets/images/viewdetails_page_birthday_1.png",
    "assets/images/viewdetails_page_birthday_1.png",
    "assets/images/viewdetails_page_birthday_1.png",
    "assets/images/viewdetails_page_birthday_1.png"
  ];
  var pageIndex = 0;
  String isSelected = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBF3B53),
        title: Text(
          "EVENT",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "League Spartan",
              fontSize: 20),
        ),
        actions: [InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProviderEvent(),));
            },
            child: Image.asset("assets/images/event_edit.png"))],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    CarouselSlider.builder(
                        itemCount: eventBanner.length,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            color: Colors.amberAccent,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              eventBanner[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        options: CarouselOptions(
                          // height: 200,

                          autoPlay: true,
                          viewportFraction: 1,
                          initialPage: 1,
                          onPageChanged: (index, reason) {
                            pageIndex = index;
                            debugPrint(pageIndex.toString());
                            setState(() {});
                          },
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    CarouselIndicator(
                      height: 10,
                      width: 10,
                      count: 5,
                      index: pageIndex,
                      activeColor: const Color(0xff863342),
                      color: const Color(0xff863342).withOpacity(.5),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                "Pramukh Event & Decoration, Surat",
                style: TextStyle(
                    color: Color(0xff863342),
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    fontFamily: "League Spartan"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Address",
                style: TextStyle(
                    color: Color(0xff656565),
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    fontFamily: "League Spartan"),
              ),
            ),
            addressDetails(text: 'Old No 689,'),
            SizedBox(height: 5),
            addressDetails(text: 'Ponamalle High Road,'),
            SizedBox(height: 5),
            addressDetails(text: 'Aminjikarai, Surat - 394540'),
            SizedBox(height: 5),
            Divider(
              indent: 15,
              endIndent: 15,
              height: 5,
              thickness: 2,
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$ 1200-2000",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "League Spartan",
                                fontWeight: FontWeight.w500,
                                color: Color(0xffBF3B53))),
                        Image.asset(
                          "assets/images/down_arrow.png",
                          height: 10.32,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Per Event (See full price list) ",
                      style: TextStyle(
                          color: Color(0xff656565),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: "League Spartan"),
                    )
                  ]),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffF0F0F0),
                      spreadRadius: 2,
                    )
                  ]),
            ),
            Divider(
              indent: 15,
              endIndent: 15,
              height: 5,
              thickness: 2,
            ),
            SizedBox(
              height: 15,
            ),
            eventDetails(text: "Cake Include", isAvailable: true),
            Divider(),
            eventDetails(text: "Is Include Food", isAvailable: true),
            Divider(),
            eventDetails(text: "Decoration Include", isAvailable: true),
            Divider(),
            eventDetails(text: "Maximum Hours", isAvailable: true),
            Divider(),
            eventDetails(text: "About the Venues"),
            addressDetails(
                text:
                    "You’ve planned an amazing event, with some inspirational speakers and engaging sessions. The \nnext challenge is to get peopleexcited about registering. Before people are willing to part with \ntheir time or money"),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          isSelected = "Photos";
                          setState(() {});
                        },
                        child: Text(
                          "Photos",
                          style: TextStyle(
                              color: Color(0xff656565),
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              fontFamily: "League Spartan"),
                        ),
                      ),
                      Container(
                          height: 2,
                          width: 50,
                          // thickness: 5,
                          color: isSelected == "Photos"
                              ? Color(0xffBF3B53)
                              : Colors.white)
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      isSelected = "Videos";
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        Text(
                          "Videos",
                          style: TextStyle(
                              color: Color(0xff656565),
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              fontFamily: "League Spartan"),
                        ),
                        Container(
                            height: 2,
                            width: 50,
                            // thickness: 5,
                            color: isSelected == "Videos"
                                ? Color(0xffBF3B53)
                                : Colors.white)
                      ],
                    ),
                  ),

                ],
              ),
            ),
            isSelected == "Photos"?
            GridView.builder(
              itemCount: 6,
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset("assets/images/photo2.png",
                      // height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover),
                );
              },
            ):Container(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  Widget addressDetails({text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        text,
        style: TextStyle(
            wordSpacing: 2,
            color: Color(0xff656565),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: "League Spartan"),
      ),
    );
  }

  Widget eventDetails({text, isAvailable}) {
    return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Color(0xff656565),
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: "League Spartan"),
            ),
            SizedBox(height: 5),
            isAvailable == true
                ? Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Color(0xffBF3B53),
                      ),
                      addressDetails(text: "Available")
                    ],
                  )
                : SizedBox.shrink(),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
