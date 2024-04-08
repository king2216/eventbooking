import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:eventbooking/login.dart';
import 'package:eventbooking/provider/addevent.dart';
import 'package:eventbooking/provider/homepage2.dart';
import 'package:eventbooking/registration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  List<String> list1 = [
    " Event planning \n made by easy...",
    " Easily book in \n your language",
    " Book in less \n time and cost"
  ];
  int selectIndex = 0;
  bool isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStorageValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/ig_splash.png",
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 60),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .50,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  Text(
                    list1[selectIndex],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: "Kanit",
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 57),
                  CarouselIndicator(
                    count: list1.length,
                    index: selectIndex,
                    activeColor: Colors.white,
                    height: 5,
                    color: Colors.white,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      if (list1.length - 1 > selectIndex) {
                        selectIndex++;
                        setState(() {});
                        debugPrint(selectIndex.toString());
                      } else {
                        if (isLogin == true) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            // return Login();
                            return HomePage2();
                          }));
                        } else {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            // return Login();
                            return Registration();
                          }));
                        }
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      // height: MediaQuery.of(context).size.height * .09,
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xffBF3B53),
                          borderRadius: BorderRadius.circular(41)),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              fontFamily: "Kanit",
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> getStorageValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool("isLogin") ?? false;
  }
}
