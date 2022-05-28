import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internmobile/signin/signinsc.dart';
import 'package:internmobile/src/page/homeSC.dart';

import '../provider/provider.dart';

class Service {
  final _formKey = GlobalKey<FormState>();
  //disini nyelesain semua firebase auth
  final auth = FirebaseAuth.instance;
  // string nampilin pesan error
  String? pesanError;
  //define membuat user
  //ngambil 3 parameter context,email,password
  void createUser(context, email, password) async {
    try {
      //ketika user buat pengguna langsung ke HomeScreen page
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomeSC()))
              });
    } catch (e) {
      //kalau error bakal nampilin dialogue error
      errorBox(context, e);
    }
  }

  //untuk user login define loginUser disini
  void loginUser(context, email, password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomeSC()))
              });
    } catch (e) {
      //kalau error bakal nampilin dialogue error
      errorBox(context, e);
    }
  }

  //untuk signout
  void signOut(context) async {
    try {
      //fungsi membantu signout
      await auth.signOut().then((value) => {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignInSc()),
                (route) => false)
          });
    } catch (e) {
      //kalau error bakal nampilin dialogue error
      errorBox(context, e);
    }
  }

  //untuk nampilin error menggunakan fungsi errorbox
  void errorBox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(e.toString()),
          );
        });
  }
  //login function
  // void signIn(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       await auth
  //           .signInWithEmailAndPassword(email: email, password: password)
  //           .then((uid) => {
  //                 Fluttertoast.showToast(msg: "Login Berhasil"),
  //                 Navigator.of(context).pushReplacement(MaterialPageRoute(
  //                     builder: (context) => const ProviderBar())),
  //               });
  //     } on FirebaseAuthException catch (error) {
  //       switch (error.code) {
  //         case "invalid-email":
  //           pesanError = "Email yang dimasukkan salah format.";

  //           break;
  //         case "wrong-password":
  //           pesanError = "Password yang dimasukkan salah.";
  //           break;
  //         case "user-not-found":
  //           pesanError = "Email yang dimasukkan tidak terdaftar.";
  //           break;
  //         case "user-disabled":
  //           pesanError = "Akun yang dimasukkan telah dinonaktifkan.";
  //           break;
  //         case "too-many-requests":
  //           pesanError = "Terlalu banyak percobaan login.";
  //           break;
  //         case "operation-not-allowed":
  //           pesanError = "Operasi tidak diizinkan.";
  //           break;
  //         default:
  //           pesanError = "Terjadi kesalahan.";
  //       }
  //       Fluttertoast.showToast(msg: pesanError!);
  //       print(error.code);
  //     }
  //   }
  // }
}
