import 'package:flutter/material.dart';

class EventBooking extends StatefulWidget {
  const EventBooking({super.key});

  @override
  State<EventBooking> createState() => _EventBookingState();
}

class _EventBookingState extends State<EventBooking> {
  String selectedVenueType = "";
  TextEditingController txtName = TextEditingController();
  TextEditingController txtAdditional = TextEditingController();
  TextEditingController txtBudget = TextEditingController();
  TextEditingController txtDate = TextEditingController();
  TextEditingController txtTime = TextEditingController();

  showToast(text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EVENT BOOK",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "League Spartan",
              fontSize: 20),
        ),
        backgroundColor: const Color(0xffBF3B53),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Event Name",
                  style: TextStyle(
                      color: Color(0xff863342),
                      fontWeight: FontWeight.w600,
                      fontFamily: "League Spartan",
                      fontSize: 26),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Pramukh Event & Decoration",
                  style: TextStyle(
                      color: Color(0xff595959),
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      fontFamily: "League Spartan"),
                ),
              ),
              details(text: "Venue Type"),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          selectedVenueType = "Indoor";
                          setState(() {});
                        },
                        child: Container(
                          // margin: EdgeInsets.only(left: 15),
                          child: Center(
                            child: Text(
                              "Indoor",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Kanit",
                                  fontWeight: FontWeight.w400,
                                  color: selectedVenueType == "Indoor"
                                      ? Colors.white
                                      : const Color(0xffBF3B53)),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height,
                          height: 55,
                          decoration: BoxDecoration(
                              color: selectedVenueType == "Indoor"
                                  ? const Color(0xffBF3B53)
                                  : Colors.white,
                              border: Border.all(color: const Color(0xffBF3B53)),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          selectedVenueType = "Outdoor";
                          setState(() {});
                        },
                        child: Container(
                          // margin: EdgeInsets.only(right: 15),
                          child: Center(
                            child: Text(
                              "Outdoor",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Kanit",
                                  fontWeight: FontWeight.w400,
                                  color: selectedVenueType == "Outdoor"
                                      ? Colors.white
                                      : const Color(0xffBF3B53)),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height,
                          height: 55,
                          decoration: BoxDecoration(
                              color: selectedVenueType == "Outdoor"
                                  ? const Color(0xffBF3B53)
                                  : Colors.white,
                              border: Border.all(color: const Color(0xffBF3B53)),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              textField(
                  text: "Name of  Your Venue",
                  txtController: txtName,
                  isRequired: true,
                  errortext: "Please enter Name"),
              const SizedBox(
                height: 35,
              ),
              textField(
                text: "Additional Details (Optional)",
                txtController: txtAdditional,
              ),
              const SizedBox(
                height: 35,
              ),
              textField(
                  text: "Budget",
                  txtController: txtBudget,
                  isRequired: true,
                  errortext: "Please enter budget"),
              const SizedBox(
                height: 34,
              ),
              details(text: "Basic info."),
              basicInfo(text: "Dipesh"),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 15,
                endIndent: 15,
              ),
              basicInfo(text: "+919913976106"),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 15,
                endIndent: 15,
              ),
              basicInfo(text: "Surat"),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 15,
                endIndent: 15,
              ),
              basicInfo(text: "Exiito,Commercial hub,Surat"),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 15,
                endIndent: 15,
              ),
              textField(
                  text: "Event Date",
                  txtController: txtDate,
                  isRequired: true,
                  errortext: "Please enter date"),
              textField(
                  text: "Event Time",
                  txtController: txtTime,
                  isRequired: true,
                  errortext: "Plrase enter time"),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (_formKey.currentState!.validate()) {

          }
          // if(selectedVenueType == ""){
            showToast("Please select venue");
          // }
          // else if (txtName.text == "") {
          //   showToast("Please enter your name");
          // } else if (txtAdditional.text == "") {
          //   showToast("Please enter your details");
          // } else if (txtBudget.text == "") {
          //   showToast("Please enter your budget");
          // } else if (txtDate.text == "") {
          //   showToast("Please enter your date");
          // } else if (txtTime.text == "") {
          //   showToast("Please enter your time");
          // } else {
          //   showDialog(
          //     context: context,
          //     builder: (context) {
          //       return AlertDialog(
          //         title: Text("Confirmation"),
          //         content: Text(
          //           "Are you sure confirm submited ?",
          //           style: TextStyle(
          //               fontFamily: "Kanit",
          //               fontWeight: FontWeight.w300,
          //               fontSize: 18,
          //               color: Color(0xff696969)),
          //         ),
          //         actions: [
          //           InkWell(
          //             onTap: () {
          //               Navigator.pop(context);
          //             },
          //             child: Container(
          //               height: 47,
          //               // width: MediaQuery.of(context).size.width*.25,
          //               width: 109,
          //               decoration: BoxDecoration(
          //                   color: Color(0xffFFCDD6),
          //                   borderRadius: BorderRadius.circular(3)),
          //               child: Center(
          //                 child: Text(
          //                   "No",
          //                   style: TextStyle(
          //                       fontFamily: "Kanit",
          //                       fontWeight: FontWeight.w400,
          //                       fontSize: 18,
          //                       color: Color(0xffBF3B53)),
          //                 ),
          //               ),
          //             ),
          //           ),
          //           InkWell(
          //             onTap: () {
          //               // Future<void> bookEvent() async {
          //               //   final response = await http.post(Uri.parse(''),
          //               //       body: {
          //               //         "name": txtName.text,
          //               //         "details": txtAdditional.text,
          //               //         "budget": txtBudget.text
          //               //       });
          //               //
          //               //   if (response.statusCode == 200) {
          //               //     Navigator.push(
          //               //         context,
          //               //         MaterialPageRoute(
          //               //           builder: (context) => MyEvent(),
          //               //         ));
          //               //   } else {
          //               //     Navigator.push(
          //               //         context,
          //               //         MaterialPageRoute(
          //               //           builder: (context) => MyEvent(),
          //               //         ));
          //               //     throw Exception('Failed to load album');
          //               //   }
          //               // }
          //
          //               // Navigator.push(context, MaterialPageRoute(
          //               //   builder: (context) => MyEvent(),));
          //             },
          //             child: Container(
          //               height: 47,
          //               // width: MediaQuery.of(context).size.width*.25,
          //               width: 109,
          //               decoration: BoxDecoration(
          //                   color: Color(0xffBF3B53),
          //                   borderRadius: BorderRadius.circular(3)),
          //               child: Center(
          //                 child: Text(
          //                   "Yes",
          //                   style: TextStyle(
          //                       fontFamily: "Kanit",
          //                       fontWeight: FontWeight.w400,
          //                       fontSize: 18,
          //                       color: Colors.white),
          //                 ),
          //               ),
          //             ),
          //           )
          //         ],
          //       );
          //     },
          //   );
          // }
        },
        child: Container(
          margin: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
              color: const Color(0xffBF3B53), borderRadius: BorderRadius.circular(3)),
          child: const Center(
            child: Text(
              "Submit",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Kanit",
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  Widget details({text}) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 22,
            fontFamily: "Kanit",
            fontWeight: FontWeight.w400,
            color: Color(0xff4E4D4D)),
      ),
    );
  }

  Widget textField(
      {String? text,
      errortext,
      TextEditingController? txtController,
      bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: txtController,
        validator: (value) {
          if (!isRequired) {
            return null;
          } else {
            if (value!.isEmpty) {
              return errortext;
            }
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: text,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD2D2D2))),
          hintStyle: const TextStyle(
              fontSize: 16,
              fontFamily: "Kanit",
              fontWeight: FontWeight.w300,
              color: Color(0xff8D8D8D)),
        ),
      ),
    );
  }

  Widget basicInfo({text}) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16,
            fontFamily: "Kanit",
            fontWeight: FontWeight.w500,
            color: Color(0xff4E4D4D)),
      ),
    );
  }
}
