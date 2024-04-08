import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
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
      ),
      body:  Container(
        margin: const EdgeInsets.all(15),
        height: 270,
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
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
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
              padding: const EdgeInsets.only(left: 15, right: 15, top: 9),
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
    );
  }
}
