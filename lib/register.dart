import 'package:eventbooking/Constant/var.dart';
import 'package:flutter/material.dart';

import 'Constant/var2.dart';
import 'homepage.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/ig_register.png",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 135),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "     India's Largest Event \nVenue Booking Platform \n      with 4000+ venues",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 150, left: 15, right: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffB3B3B3)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            spreadRadius: 2,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5)),
                    height: MediaQuery.of(context).size.height*.52,
                    // height: 410,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: CustomVariable.nameController,
                            decoration: InputDecoration(
                              prefixIcon: Image.asset(
                                  "assets/images/ic_name.png",
                                  cacheHeight: 25),
                              hintText: "Name",
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      BorderSide(color: Color(0xff979797))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      BorderSide(color: Color(0xff979797))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: CustomVariable2.cityController,

                            // controller: numberController,
                            decoration: InputDecoration(
                              prefixIcon: Image.asset(
                                  "assets/images/ic_city.png",
                                  cacheHeight: 25),
                              hintText: "City",
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      BorderSide(color: Color(0xff979797))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      BorderSide(color: Color(0xff979797))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            // controller: numberController,
                            decoration: InputDecoration(
                              prefixIcon: Image.asset(
                                  "assets/images/ic_location.png",
                                  cacheHeight: 25),
                              hintText: "Locality",
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      BorderSide(color: Color(0xff979797))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      BorderSide(color: Color(0xff979797))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            scrollPadding: EdgeInsets.all(15),
                            // controller: numberController,
                            decoration: InputDecoration(
                              prefixIcon: Image.asset(
                                  "assets/images/ic_budget.png",
                                  cacheHeight: 25),
                              hintText: "Budget",
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      BorderSide(color: Color(0xff979797))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      BorderSide(color: Color(0xff979797))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return HomePage();
                                },
                              ));
                            },
                            child: Container(
                              // height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color(0xffBF3B53),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Center(
                                child: Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
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
}
