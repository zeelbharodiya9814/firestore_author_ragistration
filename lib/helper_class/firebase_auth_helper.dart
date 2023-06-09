

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class FirebaseAuthHelper {

  FirebaseAuthHelper._();

  static final FirebaseAuthHelper firebaseAuthHelper = FirebaseAuthHelper._();

  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<Map<String, dynamic>> signInAnonymously() async {

    Map<String ,dynamic> res = {};

    try{
      UserCredential userCredential = await firebaseAuth.signInAnonymously();

      User? user = userCredential.user;

      res['user'] = user;

    }  on FirebaseAuthException catch (e) {
      print("==========================");
      print(e.code);
      print("==========================");

      switch (e.code) {
        case "operation-not-allowed" :
          res['error'] = "This service is temporary down...";
          break;
      }
    }
    return res;

  }




  Future<Map<String, dynamic>> signUp({required String email, required String password}) async {

    Map<String ,dynamic> res = {};
    try{
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      User? user =  userCredential.user;

      res['user'] = user;
    } on FirebaseAuthException catch (e) {
      print("==========================");
      print(e.code);
      print("==========================");

      switch (e.code) {
        case "email-already-in-use" :
          res['error'] = "This email already exists...";
          break;
        case "weak-password" :
          res['error'] = "This password too weak...";
          break;
        case "operation-not-allowed" :
          res['error'] = "This service is temporary down...";
          break;
      }
    }
    return res;
  }


  Future<Map<String, dynamic>> signIn({required String email, required String password}) async {

    Map<String, dynamic> res = {};

    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      User? user =  userCredential.user;

      res['user'] = user;
    } on FirebaseAuthException catch (e) {
      print("==========================");
      print(e.code);
      print("==========================");

      switch (e.code) {
        case "wrong-password" :
          res['error'] = "Password is wrong...";
          break;
        case "user-not-found" :
          res['error'] = "This user does not exists...";
          break;
        case "operation-not-allowed" :
          res['error'] = "This service is temporary down...";
          break;
      }
    }
    return res;
  }



  Future<Map<String, dynamic>> signInWithGoogle() async {

    Map<String, dynamic> res = {};

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      User? user = userCredential.user;

      res['user'] = user;

    } on FirebaseAuthException catch (e) {
      print("==========================");
      print(e.code);
      print("==========================");

      switch (e.code) {
        case "operation-not-allowed" :
          res['error'] = "This service is temporary down...";
          break;
      }
    }
    return res;
  }



  Future<void> logOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }

}







// TODO: signIn Anonymously // ok
// TODO: signUp
// TODO: signIn
// TODO: signInwithGoogle
// TODO: Logout