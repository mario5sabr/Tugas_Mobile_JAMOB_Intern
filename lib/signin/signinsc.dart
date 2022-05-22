import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internmobile/constant.dart';
import 'package:internmobile/main.dart';
import 'package:internmobile/signup/signupsc.dart';
import 'package:internmobile/src/page/homeSC.dart';
import 'package:internmobile/src/provider/provider.dart';

// ignore: use_key_in_widget_constructors
class SignInSc extends StatefulWidget {
  const SignInSc({Key? key}) : super(key: key);

  @override
  State<SignInSc> createState() => _SignInScState();
}

class _SignInScState extends State<SignInSc> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

//firebase
  final _auth = FirebaseAuth.instance;

// string nampilin pesan error
  String? pesanError;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      //validation
      validator: (value) {
        if (value!.isEmpty) {
          return ("Email tidak boleh kosong");
        }
        //expression for email validation
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return ("Email tidak valid");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.alternate_email, color: xPrimaryColor),
        hintText: "Your Email Address",
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(.2)),
        ),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      //validation
      validator: (value) {
        RegExp regExp = RegExp(r"^[a-zA-Z0-9]{6,}$");
        if (value!.isEmpty) {
          return ("Password tidak boleh kosong");
        }
        if (!regExp.hasMatch(value)) {
          return ("Password tidak valid(Minimal 6 karakter)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock, color: xPrimaryColor),
        hintText: "Your Password",
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(.2)),
        ),
      ),
    );
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30.0),
      color: xPrimaryColor,
      child: MaterialButton(
        onPressed: () {
          signIn(emailController.text, passwordController.text);
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: xPrimaryColor,
            ),
          );
        },
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
      ),
    );
    //firebase

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/jamob.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              // child: SingleChildScrollView(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 25,
              //     vertical: 120
              //   ),
              // ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "SIGN IN",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          emailField,
                          const SizedBox(height: 35),
                          passwordField,
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpSc(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Don't have an account?",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600)),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "SIGN UP",
                            style: Theme.of(context).textTheme.button,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(.5),
                              ),
                            ),
                            child: Icon(
                              Icons.facebook,
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(.5),
                              ),
                            ),
                            child: Icon(
                              Icons.email,
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                          const Spacer(),
                          loginButton
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Berhasil"),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ProviderBar())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            pesanError = "Email yang dimasukkan salah format.";

            break;
          case "wrong-password":
            pesanError = "Password yang dimasukkan salah.";
            break;
          case "user-not-found":
            pesanError = "Email yang dimasukkan tidak terdaftar.";
            break;
          case "user-disabled":
            pesanError = "Akun yang dimasukkan telah dinonaktifkan.";
            break;
          case "too-many-requests":
            pesanError = "Terlalu banyak percobaan login.";
            break;
          case "operation-not-allowed":
            pesanError = "Operasi tidak diizinkan.";
            break;
          default:
            pesanError = "Terjadi kesalahan.";
        }
        Fluttertoast.showToast(msg: pesanError!);
        print(error.code);
      }
    }
  }
}
