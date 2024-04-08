import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'eventbooking.dart';

class ViewDetails extends StatefulWidget {
  const ViewDetails({super.key});

  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  List<String> eventBanner = [
    "assets/images/viewdetails_page_birthday_1.png",
    "assets/images/viewdetails_page_birthday_1.png",
    "assets/images/viewdetails_page_birthday_1.png",
    "assets/images/viewdetails_page_birthday_1.png",
    "assets/images/viewdetails_page_birthday_1.png"
  ];
  var pageIndex = 0;

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
        actions: [Image.asset("assets/images/share.png")],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        CarouselSlider.builder(
                            itemCount: eventBanner.length,
                            itemBuilder: (context, index, realIndex) {
                              return Container(
                                color: Colors.amberAccent,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 55,
                          width: 71,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              color: Colors.black54.withOpacity(.5)),
                          child: Image.asset("assets/images/left_arrow.png"),
                        ),
                        Container(
                          height: 55,
                          width: 71,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  topLeft: Radius.circular(30)),
                              color: Colors.black54.withOpacity(.5)),
                          child: Image.asset("assets/images/rightarrow.png"),
                        ),
                      ],
                    ),
                  ],
                  alignment: AlignmentDirectional.center,
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
            SizedBox(
              height: 15.25,
            ),
            Container(
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
                      color: Colors.grey,
                      spreadRadius: 2,
                    )
                  ]),
            ),
            SizedBox(height: 15),
            Divider(
              indent: 15,
              endIndent: 15,
              height: 5,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            eventDetails(text: "Photo "),
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
            ),
            SizedBox(
              height: 10,
            ),
            eventDetails(text: "Pricing"),
            SizedBox(
              height: 8,
            ),
            addressDetails(text: "Min. Per Event"),
            SizedBox(
              height: 5,
            ),
            addressDetails(text: "\$ 1200"),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 5,
              indent: 15,
              endIndent: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 8,
            ),
            addressDetails(text: "Max. Per Event"),
            SizedBox(
              height: 5,
            ),
            addressDetails(text: "\$ 2000"),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 5,
              indent: 15,
              endIndent: 15,
              thickness: 2,
            ),
            eventDetails(text: "About the Venues"),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "INTRODUCING",
                style: TextStyle(
                    color: Color(0xff656565),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: "League Spartan"),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                " You’ve planned an amazing event, with some\n inspirational speakers and engaging sessions. The next\n challenge is to get peopleexcited about registering.\n Before people are willing to part with their time or \n money",
                style: TextStyle(
                    color: Color(0xff656565),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    wordSpacing: 2,
                    height: 1.2,
                    fontFamily: "League Spartan"),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height*0.5
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/close.png",
                                height: 60,
                              ),
                              Text(
                                "Vendor Contact Number",
                                style: TextStyle(
                                    color: Color(0xff5B5B5B),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    fontFamily: "League Spartan"),
                              )
                            ],
                          ),
                          Divider(
                            height: 2,
                            thickness: 2,
                            color: Color(0xffD0D0D0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 86, right: 86, top: 30),
                            child: Image.asset(
                              "assets/images/contact_img.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 45.33,
                          ),
                          Text(
                            "Pramukh Event & Decoration",
                            style: TextStyle(
                                color: Color(0xff5B5B5B),
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                                fontFamily: "League Spartan"),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            indent: 15,
                            endIndent: 15,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Color(0xffBF3B53),
                                borderRadius: BorderRadius.circular(3)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/call_img.png",
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "9913976106",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  child: Center(
                      child: Text("VIEW CONTACT",
                          style: TextStyle(
                              color: Color(0xffBF3B53),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: "League Spartan"))),
                  height: 50,
                  // width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xffBF3B53)),
                      borderRadius: BorderRadius.circular(3)),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EventBooking(),));
                },
                child: Container(
                  child: Center(
                      child: Text("BOOK NOW",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: "League Spartan"))),
                  height: 50,
                  // width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xffBF3B53),
                      borderRadius: BorderRadius.circular(3)),
                ),
              ),
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
            color: Color(0xff656565),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: "League Spartan"),
      ),
    );
  }

  Widget eventDetails({text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        text,
        style: TextStyle(
            color: Color(0xff656565),
            fontWeight: FontWeight.w500,
            fontSize: 20,
            fontFamily: "League Spartan"),
      ),
    );
  }
}
