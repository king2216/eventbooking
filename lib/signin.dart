import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:eventbooking/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  bool isSelected = false;
  bool isShow = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoad = false;

  showToast(text) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          alignment: AlignmentDirectional.topStart,
          "assets/images/ig_login.png",
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(top: 165),
                child: Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.all(15),
                color: Colors.white,
                child: TextFormField(
                  // keyboardType: TextInputType.text,
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter Email I'd",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                color: Colors.white,
                child: TextFormField(
                  // keyboardType: TextInputType.text,
                  controller: passwordController,
                  obscureText: isShow,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          isShow = !isShow;
                          setState(() {});
                        },
                        icon: Icon(Icons.remove_red_eye)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  final bool isValid =
                      EmailValidator.validate(emailController.text);

                  if (emailController.text.isEmpty) {
                    showToast("Please Enter Email I'd");
                  } else if (passwordController.text.isEmpty) {
                    showToast("Please Enter Password");
                  } else if (isSelected == false) {
                    showToast("Accept Terms And Condition");
                  } else if (isValid == false) {
                    showToast("Please Enter Valid Email I'd");
                  } else {
                   try{
                     FirebaseAuth.instance
                         .signInWithEmailAndPassword(
                         email: emailController.text,
                         password: passwordController.text)
                         .then((value) => {
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => Register(),
                           ))
                           .onError((error, stackTrace) => {
                         showToast(error.toString()),
                       })
                     });
                   }catch(e){
                     showToast(e.toString());
                   }


                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => Register(),
                    //     ));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
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
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                          ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.blue,
                    value: isSelected,
                    onChanged: (value) {
                      isSelected = value!;
                      setState(() {});
                    },
                  ),
                  const Flexible(
                      child: Text(
                    "By clicking I accept the terms of service and privacy policy",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.white),
                  ))
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void dataBase() {
    FirebaseFirestore.instance.collection("register").doc("demo").set({
      'email': emailController.text,
      'password': passwordController.text
    }).then((value) {
      debugPrint("Data Added");
    }).onError((error, stackTrace) {
      debugPrint("Error=>${error}");
    });
  }
}
