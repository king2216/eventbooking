import 'dart:async';

import 'package:eventbooking/provider/homepage2.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTP extends StatefulWidget {
  final String? mobileNo;
  bool isLoading = false;
  final String? verificationId;

  OTP({super.key, this.mobileNo, this.verificationId});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController otpController = TextEditingController();

  storageValue() async {}

  showToast(text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
    // restartTimer();
  }

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
                      "OTP",
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
                Text(
                  "Verify with OTP sent to ${widget.mobileNo}",
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Kaisei Tokumin",
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    style: const TextStyle(letterSpacing: 2),
                    controller: otpController,
                    // obscureText: true,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter OTP",
                      counterText: "",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if (otpController.text.isEmpty) {
                      showToast("Please Enter OTP");
                    }
                    otp();
                  },
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                        color: const Color(0xffBF3B53),
                        borderRadius: BorderRadius.circular(3)),
                    child: const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                // const Center(
                //   child: Text(
                //     "Didn’t receive OTP?   00:30 ",
                //     style: TextStyle(
                //         fontWeight: FontWeight.w600,
                //         fontSize: 13,
                //         color: Colors.white),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Didn’t receive OTP?: $_timeoutSeconds seconds',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.white),
                ),
                _timeoutSeconds == 00
                    ? TextButton(
                        onPressed: () {
                          restartTimer();
                          sendOtp();
                        },
                        child: const Text("Resend OTP"))
                    : const SizedBox.shrink()
              ],
            ),
            // 257260
          )
        ],
      ),
    );
  }

  otp() {
    FirebaseAuth auth = FirebaseAuth.instance;
    final credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId.toString(),
        smsCode: otpController.text);
    auth.signInWithCredential(credential).then((value) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLogin", true);
      return Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const HomePage2();
        },
      ));
    }).onError((error, stackTrace) {
      debugPrint("Error=>$error");
    });
  }

  Timer? _timer;
  int _timeoutSeconds = 30;

  void restartTimer() {
    _timer?.cancel();
    _timeoutSeconds = 30;
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timeoutSeconds == 0) {
          timer.cancel();
          // Handle timeout logic here
          print("OTP Timeout!");
        } else {
          setState(() {
            _timeoutSeconds--;
          });
        }
      },
    );
  }
  TextEditingController numberController = TextEditingController();
  bool otpSent = false;
  bool isLoggedIn = false;
  String? uid;
  bool isLoad = false;
  Future<void> sendOtp() async {
    isLoad = true;
    setState(() {});

    await FirebaseAuth.instance.verifyPhoneNumber(
      // timeout: Duration(seconds: 30),
        phoneNumber: "+91${widget.mobileNo}",
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
          debugPrint("vId: $verificationId");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTP(
                    mobileNo: widget.mobileNo,
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
}
