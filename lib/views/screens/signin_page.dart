import 'package:flutter/material.dart';

import '../../helper_class/firebase_auth_helper.dart';




class Signin_page extends StatefulWidget {
  const Signin_page({Key? key}) : super(key: key);

  @override
  State<Signin_page> createState() => _Signin_pageState();
}

class _Signin_pageState extends State<Signin_page> {

  String? email;
  String? password;

  GlobalKey<FormState> signInformKey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepPurple[100],
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 70,),
          Text(
            "Welcome,",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
          ),
          Text(
            "Glad to see you!",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 15,),
          Form(
            key: signInformKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 65,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
                        controller: emailcontroller,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter email...";
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 65,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
                        controller: passwordcontroller,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter password...";
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            password = val;
                          });
                          print(password);
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.black,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forget Password?",
                        style: TextStyle(
                            color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 18, right: 18),
            child: GestureDetector(
              onTap: () async {
                if (signInformKey.currentState!.validate()) {
                  signInformKey.currentState!.save();

                  Map<String, dynamic> res = await FirebaseAuthHelper
                      .firebaseAuthHelper
                      .signIn(email: email!, password: password!);

                  if (res['user'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("signIn sccessfully..."),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    Navigator.of(context).pushReplacementNamed('/' , arguments: res['user']);
                  } else if (res['error'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(res['error']),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("signIn failed..."),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                }

                emailcontroller.clear();
                passwordcontroller.clear();

                setState(() {
                  email = null;
                  password = null;
                });
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 70, right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "-------------------   Or Login with   -------------------",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 18, right: 18),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() async {
                        Map<String, dynamic> res = await FirebaseAuthHelper.firebaseAuthHelper
                            .signInWithGoogle();

                        if (res['user'] != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("signIn sccessfully..."),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          Navigator.of(context).pushReplacementNamed('/', arguments: res['user']);
                        } else if(res['error'] !=  null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(res['error']),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("signIn failed..."),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      });
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        height: 55,
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Image.asset("assets/images/google.png"),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("This sarvice temporary down..."),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      });
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        height: 55,
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Image.asset("assets/images/facebook.png"),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 140, right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushReplacementNamed('Signup_page');
                    });
                  },
                  child: Text(
                    "Sign Up Now",
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
