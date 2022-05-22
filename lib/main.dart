import 'package:flutter/material.dart';
import 'package:internmobile/constant.dart';
import 'package:internmobile/signin/signinsc.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intern JAMOB',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: xPrimaryColor,
        scaffoldBackgroundColor: xBackGroundColor,
        textTheme: const TextTheme(
          headline5:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          button: TextStyle(color: xPrimaryColor),
          headline1:
              TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(.2)),
          ),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/jamob.png"),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "INTERN JATIS MOBILE\n",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const TextSpan(
                          text: "APPLICATION FOR INTERN IN JATIS MOBILE",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          )),
                    ],
                  ),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInSc(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 26, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: xPrimaryColor,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "START APPLICATION",
                            style: Theme.of(context).textTheme.button!.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
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
