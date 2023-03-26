import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../helper_class/firebase_auth_helper.dart';


class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  String? email;
  String? password;

  GlobalKey<FormState> signUpformKey = GlobalKey<FormState>();
  GlobalKey<FormState> signInformKey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 80, right: 80),
                  child: Image.asset("assets/images/logo.gif"),
                ),
                Text(
                  "AUBookes",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.of(context).pushReplacementNamed('Signin_page');
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.of(context).pushReplacementNamed('Signup_page');
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
                      "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 220,
            ),
            GestureDetector(
              onTap: () async {
                Map<String, dynamic> res = await FirebaseAuthHelper
                    .firebaseAuthHelper
                    .signInAnonymously();

                print("res : $res");

                if (res['user'] != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Login sccessfully..."),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  Navigator.of(context)
                      .pushReplacementNamed('/', arguments: res['user']);
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
                      content: Text("Login failed..."),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              child: Text(
                "Continue as a guest",
                style: TextStyle(
                    color: Colors.blue[800],
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),



            // ElevatedButton(
            //   onPressed: () async {
            //     Map<String, dynamic> res = await FirebaseAuthHelper
            //         .firebaseAuthHelper
            //         .signInAnonymously();
            //
            //     print("res : $res");
            //
            //     if (res['user'] != null) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text("Login sccessfully..."),
            //           backgroundColor: Colors.green,
            //           behavior: SnackBarBehavior.floating,
            //         ),
            //       );
            //       Navigator.of(context)
            //           .pushReplacementNamed('/', arguments: res['user']);
            //     } else if (res['error'] != null) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text(res['error']),
            //           backgroundColor: Colors.red,
            //           behavior: SnackBarBehavior.floating,
            //         ),
            //       );
            //     } else {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text("Login failed..."),
            //           backgroundColor: Colors.red,
            //           behavior: SnackBarBehavior.floating,
            //         ),
            //       );
            //     }
            //   },
            //   child: Text("Anonymously SignIn"),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     // emailAndpasswordSignUpValidate();
            //     Navigator.of(context).pushReplacementNamed('Signup_page');
            //   },
            //   child: Text("Sign Up with  email and password"),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     // emailAndpasswordSignInValidate();
            //     Navigator.of(context).pushReplacementNamed('Signin_page');
            //   },
            //   child: Text("Sign In with email and password"),
            // ),
            // ElevatedButton(
            //   onPressed: () async {
            //     Map<String, dynamic> res = await FirebaseAuthHelper.firebaseAuthHelper
            //         .signInWithGoogle();
            //
            //     if (res['user'] != null) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text("signIn sccessfully..."),
            //           backgroundColor: Colors.green,
            //           behavior: SnackBarBehavior.floating,
            //         ),
            //       );
            //       Navigator.of(context).pushReplacementNamed('/', arguments: res['user']);
            //     } else if(res['error'] !=  null) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text(res['error']),
            //           backgroundColor: Colors.red,
            //           behavior: SnackBarBehavior.floating,
            //         ),
            //       );
            //     }else {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text("signIn failed..."),
            //           backgroundColor: Colors.red,
            //           behavior: SnackBarBehavior.floating,
            //         ),
            //       );
            //     }
            //   },
            //   child: Text("Sign In with Google"),
            // ),
          ],
        ),
      ),
    );
  }

//   emailAndpasswordSignUpValidate() {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (all) => AlertDialog(
//         backgroundColor: Colors.white,
//         content: Form(
//           key: signUpformKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 height: 15,
//               ),
//               Card(
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 child: TextFormField(
//                   controller: emailcontroller,
//                   textInputAction: TextInputAction.next,
//                   validator: (val) {
//                     if (val!.isEmpty) {
//                       return "Enter email...";
//                     }
//                   },
//                   onSaved: (val) {
//                     setState(() {
//                       email = val;
//                     });
//                   },
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.email_outlined,
//                         color: Colors.black,
//                       ),
//                       hintText: "Email",
//                       hintStyle: TextStyle(color: Colors.grey[400]),
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide.none,
//                       )),
//                 ),
//               ),
//               Card(
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 child: TextFormField(
//                   controller: passwordcontroller,
//                   textInputAction: TextInputAction.next,
//                   obscureText: true,
//                   validator: (val) {
//                     if (val!.isEmpty) {
//                       return "Enter password...";
//                     }
//                   },
//                   onSaved: (val) {
//                     setState(() {
//                       password = val;
//                     });
//                     print(password);
//                   },
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.lock_outline_rounded,
//                         color: Colors.black,
//                       ),
//                       hintText: "Password",
//                       hintStyle: TextStyle(color: Colors.grey[400]),
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide.none,
//                       )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               OutlinedButton(
//                   onPressed: () {
//                     emailcontroller.clear();
//                     passwordcontroller.clear();
//
//                     setState(() {
//                       email = null;
//                       password = null;
//                     });
//
//                     Navigator.pop(context);
//                   },
//                   child: Text("Cancel")),
//               SizedBox(
//                 width: 20,
//               ),
//               ElevatedButton(
//                   onPressed: () async {
//                     if (signUpformKey.currentState!.validate()) {
//                       signUpformKey.currentState!.save();
//
//                       Map<String, dynamic> res = await FirebaseAuthHelper
//                           .firebaseAuthHelper
//                           .signUp(email: email!, password: password!);
//
//
//                       if (res['user'] != null) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text("signUp sccessfully..."),
//                             backgroundColor: Colors.green,
//                             behavior: SnackBarBehavior.floating,
//                           ),
//                         );
//                       } else if (res['error'] != null) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(res['error']),
//                             backgroundColor: Colors.red,
//                             behavior: SnackBarBehavior.floating,
//                           ),
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text("signUp failed..."),
//                             backgroundColor: Colors.red,
//                             behavior: SnackBarBehavior.floating,
//                           ),
//                         );
//                       }
//                     }
//                     // Navigator.of(context).pushReplacementNamed('Home_page');
//
//                     emailcontroller.clear();
//                     passwordcontroller.clear();
//
//                     setState(() {
//                       email = null;
//                       password = null;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                   child: Text("SignUp")),
//             ],
//           )
//         ],
//       ),
//     );
//   // }
//
//   emailAndpasswordSignInValidate() {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (all) => AlertDialog(
//         backgroundColor: Colors.white,
//         content: Form(
//           key: signInformKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 height: 15,
//               ),
//               Card(
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 child: TextFormField(
//                   controller: emailcontroller,
//                   textInputAction: TextInputAction.next,
//                   validator: (val) {
//                     if (val!.isEmpty) {
//                       return "Enter email...";
//                     }
//                   },
//                   onSaved: (val) {
//                     setState(() {
//                       email = val;
//                     });
//                   },
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.email_outlined,
//                         color: Colors.black,
//                       ),
//                       hintText: "Email",
//                       hintStyle: TextStyle(color: Colors.grey[400]),
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide.none,
//                       )),
//                 ),
//               ),
//               Card(
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 child: TextFormField(
//                   controller: passwordcontroller,
//                   textInputAction: TextInputAction.next,
//                   obscureText: true,
//                   validator: (val) {
//                     if (val!.isEmpty) {
//                       return "Enter password...";
//                     }
//                   },
//                   onSaved: (val) {
//                     setState(() {
//                       password = val;
//                     });
//                     print(password);
//                   },
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.lock_outline,
//                         color: Colors.black,
//                       ),
//                       hintText: "Password",
//                       hintStyle: TextStyle(color: Colors.grey[400]),
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide.none,
//                       )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               OutlinedButton(
//                   onPressed: () {
//                     emailcontroller.clear();
//                     passwordcontroller.clear();
//
//                     setState(() {
//                       email = null;
//                       password = null;
//                     });
//
//                     Navigator.pop(context);
//                   },
//                   child: Text("Cancel")),
//               SizedBox(
//                 width: 20,
//               ),
//               ElevatedButton(
//                   onPressed: () async {
//                     if (signInformKey.currentState!.validate()) {
//                       signInformKey.currentState!.save();
//
//                       Map<String, dynamic> res = await FirebaseAuthHelper
//                           .firebaseAuthHelper
//                           .signIn(email: email!, password: password!);
//                       Navigator.of(context).pop();
//
//                       if (res['user'] != null) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text("signIn sccessfully..."),
//                             backgroundColor: Colors.green,
//                             behavior: SnackBarBehavior.floating,
//                           ),
//                         );
//                         Navigator.of(context).pushReplacementNamed('/' , arguments: res['user']);
//                       } else if (res['error'] != null) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(res['error']),
//                             backgroundColor: Colors.red,
//                             behavior: SnackBarBehavior.floating,
//                           ),
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text("signIn failed..."),
//                             backgroundColor: Colors.red,
//                             behavior: SnackBarBehavior.floating,
//                           ),
//                         );
//                       }
//                     }
//
//                     emailcontroller.clear();
//                     passwordcontroller.clear();
//
//                     setState(() {
//                       email = null;
//                       password = null;
//                     });
//
//                   },
//                   child: Text("SignIn")),
//             ],
//           )
//         ],
//       ),
//     );
//   }
}
