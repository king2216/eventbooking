import 'dart:io';

import 'package:eventbooking/provider/showevent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'map.dart';

import 'package:video_player/video_player.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  String selectedUploadType = "";
  XFile? image;
  List<XFile>? imageFileList = [];
  XFile? video;
  List<String> pathList = [];
  bool cakeValue = false;
  bool foodValue = false;
  bool decorationValue = false;
  final picker = ImagePicker();
  PickedFile? cameraVideo;
  TextEditingController addressController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  TextEditingController maxMemberController = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController addDetailsController = TextEditingController();

  // VideoPlayerController? controller;
  String dropdownValue = "Birthday Party";

  showToast(text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  var _formKey = GlobalKey<FormState>();
  final videoUrl = "";

  // late YoutubePlayerController ycontroller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);

    // ycontroller = YoutubePlayerController(
    //   initialVideoId: videoId!,
    // flags: YoutubePlayerFlags(
    //   autoPlay: false
    // )
    // );
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffBF3B53),
        title: const Text(
          "ADD EVENT",
          style: TextStyle(
              fontFamily: "Kanit", fontWeight: FontWeight.w400, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add Event And Details",
                    style: TextStyle(
                        color: Color(0xff863342),
                        fontFamily: "Kanit",
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // TextFormField(
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       // showToast("PLEASE ADD TITLE");
                  //       return "Please Add title";
                  //     }
                  //     return null;
                  //   },
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   decoration: InputDecoration(
                  //
                  //       hintText: "Event Title",
                  //       hintStyle: const TextStyle(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w400,
                  //           fontFamily: "Kanit",
                  //           color: Color(0xff6D6D6D)),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(3),
                  //       )),
                  // ),
                  DropdownButton<String>(
                    hint: const Text("Select Event Type"),
                    borderRadius: BorderRadius.circular(5),
                    isExpanded: true,
                    // Step 3.
                    value: dropdownValue,
                    // Step 4.
                    items: <String>[
                      'Birthday Party',
                      'Baby Shower',
                      'Baby Welcome',
                      'Ring Ceremony',
                      'Fresher Party',
                      'Wedding Anniversery'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 15),
                        ),
                      );
                    }).toList(),
                    // Step 5.
                    onChanged: (String? val) {
                      pathList.clear();
                      minPriceController.clear();
                      addressController.clear();
                      maxPriceController.clear();
                      mobilecontroller.clear();
                      maxMemberController.clear();
                      addDetailsController.clear();
                      setState(() {
                        dropdownValue = val!;
                      });
                    },
                  ),
                  if (dropdownValue == "Birthday Party") ...[
                    birthDay(),
                  ] else if (dropdownValue == "Baby Shower") ...[
                    babyShower()
                  ] else if (dropdownValue == "Baby Welcome") ...[
                    babyWelcome()
                  ] else if (dropdownValue == "Ring Ceremony") ...[
                    ringCeremony()
                  ] else if (dropdownValue == "Fresher Party") ...[
                    fresherParty()
                  ] else if (dropdownValue == "Wedding Anniversery") ...[
                    weddingAnniversery()
                  ]
                ],
              ),
            )),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShowEvent(),
                ));
          }
        },
        child: Container(
          margin: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
              color: const Color(0xffBF3B53),
              borderRadius: BorderRadius.circular(3)),
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

  addEvent() async {
    var request = await http.MultipartRequest(
        "Post", Uri.parse("localhost/priyanka/event/index.php/event/insert"));

    request.fields['event_title'] = dropdownValue.toString();
    request.fields['is_api'] = true.toString();
    request.fields['adress'] = addressController.text;
    request.fields['min_price'] = minPriceController.toString();
    request.fields['max_price'] = maxPriceController.toString();
    request.fields['contact_number'] = mobilecontroller.toString();
    request.fields['Include_cake'] = cakeValue == true ? "Yes" : "No";
    request.fields['include_food'] = foodValue == true ? "Yes" : "No";
    request.fields['include_deco'] = decorationValue == true ? "Yes" : "No";
    request.fields['Maximum_member'] = maxMemberController.toString();
    request.fields['add_details'] = addDetailsController.toString();
    request.fields['email'] = "kanthariyu@gmail.com";

    request.files.add(http.MultipartFile.fromBytes(
        'photo', File(pathList[0]!).readAsBytesSync(),
        filename: "Image0"));

    // body: {
    //   "event_title": dropdownValue,
    //   "is_api": true,
    //   "adress": addressController.text,
    //   "min_price": minPriceController,
    //   "max_price": maxPriceController,
    //   "contact_number": mobilecontroller,
    //   "Include_cake":cakeValue==true?"Yes":"No",
    //   "include_food":foodValue==true?"Yes":"No",
    //   "include_deco":decorationValue==true?"Yes":"No",
    //   "Maximum_member": maxMemberController,
    //   "add_details" : addDetailsController,
    //   "email" : "kanthariyu@gmail.com",
    //   // "photo" :
    // });
  }

  Widget birthDay() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: addressController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Add Address";
              }
              return null;
            },
            decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: () async {
                      var result = await Permission.location.request();
                      if (result.isGranted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MapLocation(),
                            ));
                      }
                    },
                    child: Image.asset(
                      "assets/images/provider/location.png",
                      height: 21.94,
                    ),
                  ),
                ),
                hintText: "Address",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  style: const TextStyle(letterSpacing: 1.5),
                  controller: minPriceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Add Min.Price";
                    } else if (double.parse(value) < 1000) {
                      return ("Minimum Price is 1000");
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Min.Price",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Kanit",
                        color: Color(0xff6D6D6D)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^([0-9]+(-[0-9]+)?)'))
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextFormField(
                  style: const TextStyle(letterSpacing: 1.5),
                  controller: maxPriceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Add Max.Price";
                    } else if (minPriceController.text.isNotEmpty &&
                        double.parse(value) <
                            double.parse(minPriceController.text)) {
                      return "Add Max. Price";
                    }

                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Max.Price",
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Kanit",
                          color: Color(0xff6D6D6D)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                      )),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^([0-9]+(-[0-9]+)?)'))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(letterSpacing: 2),
            controller: mobilecontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.length != 10) {
                return 'Mobile Number must be of 10 digit';
              } else
                return null;
            },
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: InputDecoration(
                counterText: "",
                hintText: "Contact Number",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^([0-9]+(-[0-9]+)?)'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(letterSpacing: 2),
            controller: maxMemberController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return "How Many Members?";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Maximum Member",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^([0-9]+(-[0-9]+)?)'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                value: cakeValue,
                onChanged: (value) {
                  setState(() {
                    cakeValue = value!;
                  });
                },
              ),
              const Text(
                "Is Cake Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: foodValue,
                onChanged: (value) {
                  setState(() {
                    foodValue = value!;
                  });
                },
              ),
              const Text(
                "Is Food Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: decorationValue,
                onChanged: (value) {
                  setState(() {
                    decorationValue = value!;
                  });
                },
              ),
              const Text(
                "Is Decoration Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          TextFormField(
            controller: addDetailsController,
            style: const TextStyle(letterSpacing: 2.0),
            maxLines: 5,
            decoration: InputDecoration(
                hintText: "Add Details",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    selectedUploadType = "Upload Photo";
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);

                                    try {
                                      image = await ImagePicker().pickImage(
                                          source: ImageSource.camera);
                                      if (image == null) {
                                        showToast("Please Select Image");
                                        return;
                                      }
                                      if (image != null) {
                                        pathList.add(image!.path.toString());
                                        setState(() {});
                                        debugPrint(
                                            "Path=>${image!.path.toString()}");
                                      }
                                    } catch (e) {}
                                  },
                                  child: const Text("Camera")),
                              TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);

                                    if (pathList.length < 3) {
                                      try {
                                        List<XFile>? selectImages =
                                            await ImagePicker()
                                                .pickMultiImage();
                                        if (selectImages.isEmpty) {
                                          showToast("Please Select Image");
                                          return;
                                        }
                                        ;
                                        if (selectImages.isNotEmpty) {
                                          imageFileList!.clear();
                                          imageFileList!.addAll(selectImages);
                                          if (imageFileList!.length <=
                                              3 - pathList.length) {
                                            for (int i = 0;
                                                imageFileList!.length > i;
                                                i++) {
                                              pathList.add(imageFileList![i]
                                                  .path
                                                  .toString());
                                            }
                                            setState(() {});
                                            debugPrint(
                                                "Path=>${image!.path.toString()}");
                                          } else {
                                            showToast(
                                                "Maximum 3 Images can be selected");
                                          }
                                        }
                                      } catch (e) {}
                                    } else {
                                      showToast(
                                          "Maximum 3 Images can be selected");
                                    }
                                  },
                                  child: const Text("Gallery"))
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        "Upload Photo",
                        style: TextStyle(
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: selectedUploadType == "Upload Photo"
                                ? Colors.white
                                : const Color(0xffBF3B53)),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffBF3B53)),
                      borderRadius: BorderRadius.circular(3),
                      color: selectedUploadType == "Upload Photo"
                          ? const Color(0xffBF3B53)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    selectedUploadType = "Upload Video";
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        "Upload Video",
                        style: TextStyle(
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: selectedUploadType == "Upload Video"
                                ? Colors.white
                                : const Color(0xffBF3B53)),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffBF3B53)),
                      borderRadius: BorderRadius.circular(3),
                      color: selectedUploadType == "Upload Video"
                          ? const Color(0xffBF3B53)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          selectedUploadType == "Upload Video"
              ? TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2)),
                      hintText: "Add Video Link"),
                )
              : const SizedBox.shrink(),
          pathList.isNotEmpty
              ? const Text(
                  "Preview Photo",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Kanit",
                      color: Color(0xff6D6D6D)),
                )
              : const SizedBox.shrink(),
          pathList.isNotEmpty
              ? SizedBox(
                  height: 150,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: pathList.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        // fit: StackFit.passthrough,
                        alignment: Alignment.bottomRight,
                        children: [
                          Image.file(
                            File(pathList[index]),
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width * .5,
                          ),
                          IconButton(
                              onPressed: () {
                                pathList.removeAt(index);
                                setState(() {});
                              },
                              icon: const Icon(Icons.remove_circle))
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget babyShower() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: addressController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Add Address";
              }
              return null;
            },
            decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: () async {
                      var result = await Permission.location.request();
                      if (result.isGranted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MapLocation(),
                            ));
                      }
                    },
                    child: Image.asset(
                      "assets/images/provider/location.png",
                      height: 21.94,
                    ),
                  ),
                ),
                hintText: "Address",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  style: const TextStyle(letterSpacing: 1.5),
                  controller: minPriceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Add Min.Price";
                    } else if (double.parse(value) < 1000) {
                      return ("Minimum Price is 1000");
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Min.Price",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Kanit",
                        color: Color(0xff6D6D6D)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^([0-9]+(-[0-9]+)?)'))
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextFormField(
                  style: const TextStyle(letterSpacing: 1.5),
                  controller: maxPriceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Add Max.Price";
                    } else if (minPriceController.text.isNotEmpty &&
                        double.parse(value) <
                            double.parse(minPriceController.text)) {
                      return "Add Max. Price";
                    }

                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Max.Price",
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Kanit",
                          color: Color(0xff6D6D6D)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                      )),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^([0-9]+(-[0-9]+)?)'))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(letterSpacing: 2),
            controller: mobilecontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.length != 10) {
                return 'Mobile Number must be of 10 digit';
              } else
                return null;
            },
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: InputDecoration(
                counterText: "",
                hintText: "Contact Number",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^([0-9]+(-[0-9]+)?)'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(letterSpacing: 2),
            controller: maxMemberController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return "How Many Members?";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Maximum Member",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^([0-9]+(-[0-9]+)?)'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                value: cakeValue,
                onChanged: (value) {
                  setState(() {
                    cakeValue = value!;
                  });
                },
              ),
              const Text(
                "Is Cake Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: foodValue,
                onChanged: (value) {
                  setState(() {
                    foodValue = value!;
                  });
                },
              ),
              const Text(
                "Is Food Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: decorationValue,
                onChanged: (value) {
                  setState(() {
                    decorationValue = value!;
                  });
                },
              ),
              const Text(
                "Is Decoration Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          TextFormField(
            controller: addDetailsController,
            style: const TextStyle(letterSpacing: 2.0),
            maxLines: 5,
            decoration: InputDecoration(
                hintText: "Add Details",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    selectedUploadType = "Upload Photo";
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);

                                    try {
                                      image = await ImagePicker().pickImage(
                                          source: ImageSource.camera);
                                      if (image == null) {
                                        showToast("Please Select Image");
                                        return;
                                      }
                                      if (image != null) {
                                        pathList.add(image!.path.toString());
                                        setState(() {});
                                        debugPrint(
                                            "Path=>${image!.path.toString()}");
                                      }
                                    } catch (e) {}
                                  },
                                  child: const Text("Camera")),
                              TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);

                                    if (pathList.length < 3) {
                                      try {
                                        List<XFile>? selectImages =
                                        await ImagePicker()
                                            .pickMultiImage();
                                        if (selectImages.isEmpty) {
                                          showToast("Please Select Image");
                                          return;
                                        }
                                        ;
                                        if (selectImages.isNotEmpty) {
                                          imageFileList!.clear();
                                          imageFileList!.addAll(selectImages);
                                          if (imageFileList!.length <=
                                              3 - pathList.length) {
                                            for (int i = 0;
                                            imageFileList!.length > i;
                                            i++) {
                                              pathList.add(imageFileList![i]
                                                  .path
                                                  .toString());
                                            }
                                            setState(() {});
                                            debugPrint(
                                                "Path=>${image!.path.toString()}");
                                          } else {
                                            showToast(
                                                "Maximum 3 Images can be selected");
                                          }
                                        }
                                      } catch (e) {}
                                    } else {
                                      showToast(
                                          "Maximum 3 Images can be selected");
                                    }
                                  },
                                  child: const Text("Gallery"))
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        "Upload Photo",
                        style: TextStyle(
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: selectedUploadType == "Upload Photo"
                                ? Colors.white
                                : const Color(0xffBF3B53)),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffBF3B53)),
                      borderRadius: BorderRadius.circular(3),
                      color: selectedUploadType == "Upload Photo"
                          ? const Color(0xffBF3B53)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    selectedUploadType = "Upload Video";
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        "Upload Video",
                        style: TextStyle(
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: selectedUploadType == "Upload Video"
                                ? Colors.white
                                : const Color(0xffBF3B53)),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffBF3B53)),
                      borderRadius: BorderRadius.circular(3),
                      color: selectedUploadType == "Upload Video"
                          ? const Color(0xffBF3B53)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          selectedUploadType == "Upload Video"
              ? TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2)),
                hintText: "Add Video Link"),
          )
              : const SizedBox.shrink(),
          pathList.isNotEmpty
              ? const Text(
            "Preview Photo",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Kanit",
                color: Color(0xff6D6D6D)),
          )
              : const SizedBox.shrink(),
          pathList.isNotEmpty
              ? SizedBox(
            height: 150,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: pathList.length,
              itemBuilder: (context, index) {
                return Stack(
                  // fit: StackFit.passthrough,
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.file(
                      File(pathList[index]),
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * .5,
                    ),
                    IconButton(
                        onPressed: () {
                          pathList.removeAt(index);
                          setState(() {});
                        },
                        icon: const Icon(Icons.remove_circle))
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget babyWelcome() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: addressController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Add Address";
              }
              return null;
            },
            decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: () async {
                      var result = await Permission.location.request();
                      if (result.isGranted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MapLocation(),
                            ));
                      }
                    },
                    child: Image.asset(
                      "assets/images/provider/location.png",
                      height: 21.94,
                    ),
                  ),
                ),
                hintText: "Address",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  style: const TextStyle(letterSpacing: 1.5),
                  controller: minPriceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Add Min.Price";
                    } else if (double.parse(value) < 1000) {
                      return ("Minimum Price is 1000");
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Min.Price",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Kanit",
                        color: Color(0xff6D6D6D)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^([0-9]+(-[0-9]+)?)'))
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextFormField(
                  style: const TextStyle(letterSpacing: 1.5),
                  controller: maxPriceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Add Max.Price";
                    } else if (minPriceController.text.isNotEmpty &&
                        double.parse(value) <
                            double.parse(minPriceController.text)) {
                      return "Add Max. Price";
                    }

                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Max.Price",
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Kanit",
                          color: Color(0xff6D6D6D)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                      )),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^([0-9]+(-[0-9]+)?)'))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(letterSpacing: 2),
            controller: mobilecontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.length != 10) {
                return 'Mobile Number must be of 10 digit';
              } else
                return null;
            },
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: InputDecoration(
                counterText: "",
                hintText: "Contact Number",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^([0-9]+(-[0-9]+)?)'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(letterSpacing: 2),
            controller: maxMemberController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return "How Many Members?";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Maximum Member",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^([0-9]+(-[0-9]+)?)'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                value: cakeValue,
                onChanged: (value) {
                  setState(() {
                    cakeValue = value!;
                  });
                },
              ),
              const Text(
                "Is Cake Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: foodValue,
                onChanged: (value) {
                  setState(() {
                    foodValue = value!;
                  });
                },
              ),
              const Text(
                "Is Food Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: decorationValue,
                onChanged: (value) {
                  setState(() {
                    decorationValue = value!;
                  });
                },
              ),
              const Text(
                "Is Decoration Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          TextFormField(
            controller: addDetailsController,
            style: const TextStyle(letterSpacing: 2.0),
            maxLines: 5,
            decoration: InputDecoration(
                hintText: "Add Details",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    selectedUploadType = "Upload Photo";
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);

                                    try {
                                      image = await ImagePicker().pickImage(
                                          source: ImageSource.camera);
                                      if (image == null) {
                                        showToast("Please Select Image");
                                        return;
                                      }
                                      if (image != null) {
                                        pathList.add(image!.path.toString());
                                        setState(() {});
                                        debugPrint(
                                            "Path=>${image!.path.toString()}");
                                      }
                                    } catch (e) {}
                                  },
                                  child: const Text("Camera")),
                              TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);

                                    if (pathList.length < 3) {
                                      try {
                                        List<XFile>? selectImages =
                                        await ImagePicker()
                                            .pickMultiImage();
                                        if (selectImages.isEmpty) {
                                          showToast("Please Select Image");
                                          return;
                                        }
                                        ;
                                        if (selectImages.isNotEmpty) {
                                          imageFileList!.clear();
                                          imageFileList!.addAll(selectImages);
                                          if (imageFileList!.length <=
                                              3 - pathList.length) {
                                            for (int i = 0;
                                            imageFileList!.length > i;
                                            i++) {
                                              pathList.add(imageFileList![i]
                                                  .path
                                                  .toString());
                                            }
                                            setState(() {});
                                            debugPrint(
                                                "Path=>${image!.path.toString()}");
                                          } else {
                                            showToast(
                                                "Maximum 3 Images can be selected");
                                          }
                                        }
                                      } catch (e) {}
                                    } else {
                                      showToast(
                                          "Maximum 3 Images can be selected");
                                    }
                                  },
                                  child: const Text("Gallery"))
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        "Upload Photo",
                        style: TextStyle(
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: selectedUploadType == "Upload Photo"
                                ? Colors.white
                                : const Color(0xffBF3B53)),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffBF3B53)),
                      borderRadius: BorderRadius.circular(3),
                      color: selectedUploadType == "Upload Photo"
                          ? const Color(0xffBF3B53)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    selectedUploadType = "Upload Video";
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        "Upload Video",
                        style: TextStyle(
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: selectedUploadType == "Upload Video"
                                ? Colors.white
                                : const Color(0xffBF3B53)),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffBF3B53)),
                      borderRadius: BorderRadius.circular(3),
                      color: selectedUploadType == "Upload Video"
                          ? const Color(0xffBF3B53)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          selectedUploadType == "Upload Video"
              ? TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2)),
                hintText: "Add Video Link"),
          )
              : const SizedBox.shrink(),
          pathList.isNotEmpty
              ? const Text(
            "Preview Photo",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Kanit",
                color: Color(0xff6D6D6D)),
          )
              : const SizedBox.shrink(),
          pathList.isNotEmpty
              ? SizedBox(
            height: 150,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: pathList.length,
              itemBuilder: (context, index) {
                return Stack(
                  // fit: StackFit.passthrough,
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.file(
                      File(pathList[index]),
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * .5,
                    ),
                    IconButton(
                        onPressed: () {
                          pathList.removeAt(index);
                          setState(() {});
                        },
                        icon: const Icon(Icons.remove_circle))
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
  Widget ringCeremony() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: addressController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Add Address";
              }
              return null;
            },
            decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: () async {
                      var result = await Permission.location.request();
                      if (result.isGranted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MapLocation(),
                            ));
                      }
                    },
                    child: Image.asset(
                      "assets/images/provider/location.png",
                      height: 21.94,
                    ),
                  ),
                ),
                hintText: "Address",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  style: const TextStyle(letterSpacing: 1.5),
                  controller: minPriceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Add Min.Price";
                    } else if (double.parse(value) < 1000) {
                      return ("Minimum Price is 1000");
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Min.Price",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Kanit",
                        color: Color(0xff6D6D6D)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^([0-9]+(-[0-9]+)?)'))
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextFormField(
                  style: const TextStyle(letterSpacing: 1.5),
                  controller: maxPriceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Add Max.Price";
                    } else if (minPriceController.text.isNotEmpty &&
                        double.parse(value) <
                            double.parse(minPriceController.text)) {
                      return "Add Max. Price";
                    }

                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Max.Price",
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Kanit",
                          color: Color(0xff6D6D6D)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                      )),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^([0-9]+(-[0-9]+)?)'))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(letterSpacing: 2),
            controller: mobilecontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.length != 10) {
                return 'Mobile Number must be of 10 digit';
              } else
                return null;
            },
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: InputDecoration(
                counterText: "",
                hintText: "Contact Number",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^([0-9]+(-[0-9]+)?)'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(letterSpacing: 2),
            controller: maxMemberController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return "How Many Members?";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Maximum Member",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^([0-9]+(-[0-9]+)?)'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                value: cakeValue,
                onChanged: (value) {
                  setState(() {
                    cakeValue = value!;
                  });
                },
              ),
              const Text(
                "Is Cake Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: foodValue,
                onChanged: (value) {
                  setState(() {
                    foodValue = value!;
                  });
                },
              ),
              const Text(
                "Is Food Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: decorationValue,
                onChanged: (value) {
                  setState(() {
                    decorationValue = value!;
                  });
                },
              ),
              const Text(
                "Is Decoration Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          TextFormField(
            controller: addDetailsController,
            style: const TextStyle(letterSpacing: 2.0),
            maxLines: 5,
            decoration: InputDecoration(
                hintText: "Add Details",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    selectedUploadType = "Upload Photo";
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);

                                    try {
                                      image = await ImagePicker().pickImage(
                                          source: ImageSource.camera);
                                      if (image == null) {
                                        showToast("Please Select Image");
                                        return;
                                      }
                                      if (image != null) {
                                        pathList.add(image!.path.toString());
                                        setState(() {});
                                        debugPrint(
                                            "Path=>${image!.path.toString()}");
                                      }
                                    } catch (e) {}
                                  },
                                  child: const Text("Camera")),
                              TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);

                                    if (pathList.length < 3) {
                                      try {
                                        List<XFile>? selectImages =
                                        await ImagePicker()
                                            .pickMultiImage();
                                        if (selectImages.isEmpty) {
                                          showToast("Please Select Image");
                                          return;
                                        }
                                        ;
                                        if (selectImages.isNotEmpty) {
                                          imageFileList!.clear();
                                          imageFileList!.addAll(selectImages);
                                          if (imageFileList!.length <=
                                              3 - pathList.length) {
                                            for (int i = 0;
                                            imageFileList!.length > i;
                                            i++) {
                                              pathList.add(imageFileList![i]
                                                  .path
                                                  .toString());
                                            }
                                            setState(() {});
                                            debugPrint(
                                                "Path=>${image!.path.toString()}");
                                          } else {
                                            showToast(
                                                "Maximum 3 Images can be selected");
                                          }
                                        }
                                      } catch (e) {}
                                    } else {
                                      showToast(
                                          "Maximum 3 Images can be selected");
                                    }
                                  },
                                  child: const Text("Gallery"))
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        "Upload Photo",
                        style: TextStyle(
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: selectedUploadType == "Upload Photo"
                                ? Colors.white
                                : const Color(0xffBF3B53)),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffBF3B53)),
                      borderRadius: BorderRadius.circular(3),
                      color: selectedUploadType == "Upload Photo"
                          ? const Color(0xffBF3B53)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    selectedUploadType = "Upload Video";
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        "Upload Video",
                        style: TextStyle(
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: selectedUploadType == "Upload Video"
                                ? Colors.white
                                : const Color(0xffBF3B53)),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffBF3B53)),
                      borderRadius: BorderRadius.circular(3),
                      color: selectedUploadType == "Upload Video"
                          ? const Color(0xffBF3B53)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          selectedUploadType == "Upload Video"
              ? TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2)),
                hintText: "Add Video Link"),
          )
              : const SizedBox.shrink(),
          pathList.isNotEmpty
              ? const Text(
            "Preview Photo",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Kanit",
                color: Color(0xff6D6D6D)),
          )
              : const SizedBox.shrink(),
          pathList.isNotEmpty
              ? SizedBox(
            height: 150,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: pathList.length,
              itemBuilder: (context, index) {
                return Stack(
                  // fit: StackFit.passthrough,
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.file(
                      File(pathList[index]),
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * .5,
                    ),
                    IconButton(
                        onPressed: () {
                          pathList.removeAt(index);
                          setState(() {});
                        },
                        icon: const Icon(Icons.remove_circle))
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget fresherParty() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: addressController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Add Address";
              }
              return null;
            },
            decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: () async {
                      var result = await Permission.location.request();
                      if (result.isGranted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MapLocation(),
                            ));
                      }
                    },
                    child: Image.asset(
                      "assets/images/provider/location.png",
                      height: 21.94,
                    ),
                  ),
                ),
                hintText: "Address",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  style: const TextStyle(letterSpacing: 1.5),
                  controller: minPriceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Add Min.Price";
                    } else if (double.parse(value) < 1000) {
                      return ("Minimum Price is 1000");
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Min.Price",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Kanit",
                        color: Color(0xff6D6D6D)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^([0-9]+(-[0-9]+)?)'))
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextFormField(
                  style: const TextStyle(letterSpacing: 1.5),
                  controller: maxPriceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Add Max.Price";
                    } else if (minPriceController.text.isNotEmpty &&
                        double.parse(value) <
                            double.parse(minPriceController.text)) {
                      return "Add Max. Price";
                    }

                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Max.Price",
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Kanit",
                          color: Color(0xff6D6D6D)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                      )),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^([0-9]+(-[0-9]+)?)'))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(letterSpacing: 2),
            controller: mobilecontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.length != 10) {
                return 'Mobile Number must be of 10 digit';
              } else
                return null;
            },
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: InputDecoration(
                counterText: "",
                hintText: "Contact Number",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^([0-9]+(-[0-9]+)?)'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(letterSpacing: 2),
            controller: maxMemberController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return "How Many Members?";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Maximum Member",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^([0-9]+(-[0-9]+)?)'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                value: cakeValue,
                onChanged: (value) {
                  setState(() {
                    cakeValue = value!;
                  });
                },
              ),
              const Text(
                "Is Cake Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: foodValue,
                onChanged: (value) {
                  setState(() {
                    foodValue = value!;
                  });
                },
              ),
              const Text(
                "Is Food Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: decorationValue,
                onChanged: (value) {
                  setState(() {
                    decorationValue = value!;
                  });
                },
              ),
              const Text(
                "Is Decoration Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          TextFormField(
            controller: addDetailsController,
            style: const TextStyle(letterSpacing: 2.0),
            maxLines: 5,
            decoration: InputDecoration(
                hintText: "Add Details",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    selectedUploadType = "Upload Photo";
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);

                                    try {
                                      image = await ImagePicker().pickImage(
                                          source: ImageSource.camera);
                                      if (image == null) {
                                        showToast("Please Select Image");
                                        return;
                                      }
                                      if (image != null) {
                                        pathList.add(image!.path.toString());
                                        setState(() {});
                                        debugPrint(
                                            "Path=>${image!.path.toString()}");
                                      }
                                    } catch (e) {}
                                  },
                                  child: const Text("Camera")),
                              TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);

                                    if (pathList.length < 3) {
                                      try {
                                        List<XFile>? selectImages =
                                        await ImagePicker()
                                            .pickMultiImage();
                                        if (selectImages.isEmpty) {
                                          showToast("Please Select Image");
                                          return;
                                        }
                                        ;
                                        if (selectImages.isNotEmpty) {
                                          imageFileList!.clear();
                                          imageFileList!.addAll(selectImages);
                                          if (imageFileList!.length <=
                                              3 - pathList.length) {
                                            for (int i = 0;
                                            imageFileList!.length > i;
                                            i++) {
                                              pathList.add(imageFileList![i]
                                                  .path
                                                  .toString());
                                            }
                                            setState(() {});
                                            debugPrint(
                                                "Path=>${image!.path.toString()}");
                                          } else {
                                            showToast(
                                                "Maximum 3 Images can be selected");
                                          }
                                        }
                                      } catch (e) {}
                                    } else {
                                      showToast(
                                          "Maximum 3 Images can be selected");
                                    }
                                  },
                                  child: const Text("Gallery"))
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        "Upload Photo",
                        style: TextStyle(
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: selectedUploadType == "Upload Photo"
                                ? Colors.white
                                : const Color(0xffBF3B53)),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffBF3B53)),
                      borderRadius: BorderRadius.circular(3),
                      color: selectedUploadType == "Upload Photo"
                          ? const Color(0xffBF3B53)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    selectedUploadType = "Upload Video";
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        "Upload Video",
                        style: TextStyle(
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: selectedUploadType == "Upload Video"
                                ? Colors.white
                                : const Color(0xffBF3B53)),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffBF3B53)),
                      borderRadius: BorderRadius.circular(3),
                      color: selectedUploadType == "Upload Video"
                          ? const Color(0xffBF3B53)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          selectedUploadType == "Upload Video"
              ? TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2)),
                hintText: "Add Video Link"),
          )
              : const SizedBox.shrink(),
          pathList.isNotEmpty
              ? const Text(
            "Preview Photo",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Kanit",
                color: Color(0xff6D6D6D)),
          )
              : const SizedBox.shrink(),
          pathList.isNotEmpty
              ? SizedBox(
            height: 150,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: pathList.length,
              itemBuilder: (context, index) {
                return Stack(
                  // fit: StackFit.passthrough,
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.file(
                      File(pathList[index]),
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * .5,
                    ),
                    IconButton(
                        onPressed: () {
                          pathList.removeAt(index);
                          setState(() {});
                        },
                        icon: const Icon(Icons.remove_circle))
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget weddingAnniversery() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: addressController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Add Address";
              }
              return null;
            },
            decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: () async {
                      var result = await Permission.location.request();
                      if (result.isGranted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MapLocation(),
                            ));
                      }
                    },
                    child: Image.asset(
                      "assets/images/provider/location.png",
                      height: 21.94,
                    ),
                  ),
                ),
                hintText: "Address",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  style: const TextStyle(letterSpacing: 1.5),
                  controller: minPriceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Add Min.Price";
                    } else if (double.parse(value) < 1000) {
                      return ("Minimum Price is 1000");
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Min.Price",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Kanit",
                        color: Color(0xff6D6D6D)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^([0-9]+(-[0-9]+)?)'))
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextFormField(
                  style: const TextStyle(letterSpacing: 1.5),
                  controller: maxPriceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Add Max.Price";
                    } else if (minPriceController.text.isNotEmpty &&
                        double.parse(value) <
                            double.parse(minPriceController.text)) {
                      return "Add Max. Price";
                    }

                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Max.Price",
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Kanit",
                          color: Color(0xff6D6D6D)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                      )),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^([0-9]+(-[0-9]+)?)'))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(letterSpacing: 2),
            controller: mobilecontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.length != 10) {
                return 'Mobile Number must be of 10 digit';
              } else
                return null;
            },
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: InputDecoration(
                counterText: "",
                hintText: "Contact Number",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^([0-9]+(-[0-9]+)?)'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(letterSpacing: 2),
            controller: maxMemberController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return "How Many Members?";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Maximum Member",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^([0-9]+(-[0-9]+)?)'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                value: cakeValue,
                onChanged: (value) {
                  setState(() {
                    cakeValue = value!;
                  });
                },
              ),
              const Text(
                "Is Cake Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: foodValue,
                onChanged: (value) {
                  setState(() {
                    foodValue = value!;
                  });
                },
              ),
              const Text(
                "Is Food Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: decorationValue,
                onChanged: (value) {
                  setState(() {
                    decorationValue = value!;
                  });
                },
              ),
              const Text(
                "Is Decoration Include ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
              )
            ],
          ),
          TextFormField(
            controller: addDetailsController,
            style: const TextStyle(letterSpacing: 2.0),
            maxLines: 5,
            decoration: InputDecoration(
                hintText: "Add Details",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                    color: Color(0xff6D6D6D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    selectedUploadType = "Upload Photo";
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);

                                    try {
                                      image = await ImagePicker().pickImage(
                                          source: ImageSource.camera);
                                      if (image == null) {
                                        showToast("Please Select Image");
                                        return;
                                      }
                                      if (image != null) {
                                        pathList.add(image!.path.toString());
                                        setState(() {});
                                        debugPrint(
                                            "Path=>${image!.path.toString()}");
                                      }
                                    } catch (e) {}
                                  },
                                  child: const Text("Camera")),
                              TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);

                                    if (pathList.length < 3) {
                                      try {
                                        List<XFile>? selectImages =
                                        await ImagePicker()
                                            .pickMultiImage();
                                        if (selectImages.isEmpty) {
                                          showToast("Please Select Image");
                                          return;
                                        }
                                        ;
                                        if (selectImages.isNotEmpty) {
                                          imageFileList!.clear();
                                          imageFileList!.addAll(selectImages);
                                          if (imageFileList!.length <=
                                              3 - pathList.length) {
                                            for (int i = 0;
                                            imageFileList!.length > i;
                                            i++) {
                                              pathList.add(imageFileList![i]
                                                  .path
                                                  .toString());
                                            }
                                            setState(() {});
                                            debugPrint(
                                                "Path=>${image!.path.toString()}");
                                          } else {
                                            showToast(
                                                "Maximum 3 Images can be selected");
                                          }
                                        }
                                      } catch (e) {}
                                    } else {
                                      showToast(
                                          "Maximum 3 Images can be selected");
                                    }
                                  },
                                  child: const Text("Gallery"))
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        "Upload Photo",
                        style: TextStyle(
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: selectedUploadType == "Upload Photo"
                                ? Colors.white
                                : const Color(0xffBF3B53)),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffBF3B53)),
                      borderRadius: BorderRadius.circular(3),
                      color: selectedUploadType == "Upload Photo"
                          ? const Color(0xffBF3B53)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    selectedUploadType = "Upload Video";
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        "Upload Video",
                        style: TextStyle(
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: selectedUploadType == "Upload Video"
                                ? Colors.white
                                : const Color(0xffBF3B53)),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffBF3B53)),
                      borderRadius: BorderRadius.circular(3),
                      color: selectedUploadType == "Upload Video"
                          ? const Color(0xffBF3B53)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          selectedUploadType == "Upload Video"
              ? TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2)),
                hintText: "Add Video Link"),
          )
              : const SizedBox.shrink(),
          pathList.isNotEmpty
              ? const Text(
            "Preview Photo",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Kanit",
                color: Color(0xff6D6D6D)),
          )
              : const SizedBox.shrink(),
          pathList.isNotEmpty
              ? SizedBox(
            height: 150,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: pathList.length,
              itemBuilder: (context, index) {
                return Stack(
                  // fit: StackFit.passthrough,
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.file(
                      File(pathList[index]),
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * .5,
                    ),
                    IconButton(
                        onPressed: () {
                          pathList.removeAt(index);
                          setState(() {});
                        },
                        icon: const Icon(Icons.remove_circle))
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }


}
