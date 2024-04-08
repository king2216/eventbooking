import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'otp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  showToast(text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  bool isSelected = false;
  Future<FirebaseApp>? firebaseApp;
  TextEditingController numberController = TextEditingController();
  bool isLoggedIn = false;
  bool otpSent = false;
  String? verificationId;
  String? uid;
  bool isLoad = false;

  Future<void> sendOtp() async {
    isLoad = true;
    setState(() {});
    await FirebaseAuth.instance.verifyPhoneNumber(
        // timeout: Duration(seconds: 30),
        phoneNumber: "+91${numberController.text}",
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        verificationFailed: (authException) {
          debugPrint(authException.toString());
          isLoad = false;
          setState(() {});
        },
        codeSent: (verification, int? verificationId) {
          isLoad = false;
          setState(() {});
          debugPrint(verification);
          debugPrint(verificationId.toString());
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTP(
                    mobileNo: numberController.text,
                    verificationId: verification),
              ));
        },
        codeAutoRetrievalTimeout: (time) {
          isLoad = false;
          setState(() {});
        });
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    setState(() {
      verificationId = verificationId;
      otpSent = true;
    });
  }

  void codeSent(String verificationId, [int? a]) {
    setState(() {
      verificationId = verificationId;
      otpSent = true;
    });
  }

  Future<void> verificationFailed(FirebaseAuthException exception) async {
    print(exception.message);
    setState(() {
      isLoggedIn = false;
      otpSent = false;
    });
  }

  Future<void> verificationCompleted(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
    if (FirebaseAuth.instance.currentUser != null) {
      setState(() {
        isLoggedIn = true;
        uid = FirebaseAuth.instance.currentUser?.uid;
      });
    } else {
      print("Failed to SignIn");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseApp = Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            alignment: AlignmentDirectional.topStart,
            "assets/images/ig_login.png",
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 165),
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 108,
                ),
                const Text(
                  "Enter your mobile \nnumber to continue",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Kaisei Tokumin",
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    return Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3)),
                      child: TextFormField(
                        style: TextStyle(letterSpacing: 2),
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: numberController,
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: "Enter Mobile Number",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Kanit",
                              color: Color(0xff6D6D6D)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    );
                  }, future: null,
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if (numberController.text.isEmpty) {
                      showToast("Please Enter Mobile No");
                    } else if (numberController.text.length != 10) {
                      showToast("Please Enter Valid Mobile Number");
                    } else if (isSelected == true) {
                      sendOtp();
                    } else {
                      showToast("Accept Terms And Condition");
                    }
                  },
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    // width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                        color: const Color(0xffBF3B53),
                        borderRadius: BorderRadius.circular(3)),
                    child: isLoad == true
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : const Center(
                            child: Text(
                              "Get OTP",
                              style: TextStyle(
                                  fontFamily: "Kanit",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Checkbox(
                      side: BorderSide(color: Colors.white),
                      checkColor: Colors.white,
                      activeColor: Color(0xffBF3B53),
                      value: isSelected,
                      onChanged: (value) {
                        isSelected = value!;
                        setState(() {});
                      },
                    ),
                    Flexible(
                      child: RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                            text: ("By clicking I accept the  "),
                            style: TextStyle(
                                fontFamily: "Kaisei Tokumin",
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                          TextSpan(
                            text: ("terms of service"),
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: "Kaisei Tokumin",
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                          TextSpan(
                            text: (" and  "),
                            style: TextStyle(
                                // decoration: TextDecoration.underline,
                                fontFamily: "Kaisei Tokumin",
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                          TextSpan(
                            text: ("privecy policy"),
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: "Kaisei Tokumin",
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                        ],
                      )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
