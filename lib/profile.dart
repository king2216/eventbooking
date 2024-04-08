import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Constant/var.dart';

class Profile extends StatefulWidget {
  final String? imgPath;
  const Profile({super.key,this.imgPath});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile? image;
  List<String> pathList = [];

  List<XFile>? imageFileList = [];

  showToast(text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  void initState() {
    super.initState();
    if(widget.imgPath != ""){
      image = XFile(widget.imgPath!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MY PROFILE",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "League Spartan",
              fontSize: 20),
        ),
        backgroundColor: const Color(0xffBF3B53),
        actions: [
          Image.asset(
            "assets/images/ic_share.png",
            cacheHeight: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                image == null
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
                                  File(image!.path.toString()),
                                  fit: BoxFit.cover,
                                )))),
                Positioned(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            pathList
                                                .add(image!.path.toString());
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

                                        try {
                                          image = await ImagePicker().pickImage(
                                              source: ImageSource.gallery);
                                          if (image == null) {
                                            showToast("Please Select Image");
                                            return;
                                          }
                                          if (image != null) {
                                            pathList
                                                .add(image!.path.toString());
                                            setState(() {});
                                            debugPrint(
                                                "Path=>${image!.path.toString()}");
                                          }
                                        } catch (e) {}
                                      },
                                      child: const Text("Gallery"))
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Image.asset(
                        "assets/images/ic-edit.png",
                        height: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: CustomVariable.nameController,
              decoration: InputDecoration(
                suffixIcon:
                    Image.asset("assets/images/ic-edit.png", cacheHeight: 20),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: Color(0xff979797))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: Color(0xff979797))),
                //
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context,image!.path.toString());
              },
              child: Container(
                height: 65,
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    "Apply",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Kanit",
                        color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffBF3B53),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
// _getFromGallery() async {
//   PickedFile pickedFile = await ImagePicker().getImage(
//     source: ImageSource.gallery,
//     maxWidth: 1800,
//     maxHeight: 1800,
//   );
//   if (pickedFile != null) {
//     XFile imageFile = XFile(pickedFile.path);
//   }
// }
}
