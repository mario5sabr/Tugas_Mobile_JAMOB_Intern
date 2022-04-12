import 'package:flutter/material.dart';
import 'package:internmobile/signin/signinsc.dart';

class SignUpSc extends StatefulWidget {
  const SignUpSc({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpScState createState() => _SignUpScState();
}

class _SignUpScState extends State<SignUpSc> {
  bool isRememberMe = false;
  var _flters = [];
  String? _sGroup;
  String? _sType;

  final List _listGroup = ["Shared", "Dedicated", "OnPrem"];
  final List _listType = ["FAQ", "Transactional"];

  // late ServiceGroup selectedServiceGroup;
  // List<ServiceGroup> serviceGroups = [
  //   ServiceGroup("Shared"),
  //   ServiceGroup("Dedicated"),
  //   ServiceGroup("OnPrem")
  // ];

  // List<DropdownMenuItem> generateItems(List<ServiceGroup> serviceGroups) {
  //   List<DropdownMenuItem> items = [];
  //   for (var item in serviceGroups) {
  //     items.add(DropdownMenuItem(
  //       child: Text(item.name),
  //       value: item,
  //     ));
  //   }
  //   return items;
  // }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: const InputDecoration(filled: true))
        ],
      ),
    );
  }

  Widget _entryDropdown() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Service Group',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
            width: 240,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: DropdownButtonFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(width: 3, color: Colors.white),
                )),
                isExpanded: true,
                hint: const Text("Select Your Service Group"),
                value: _sGroup,
                items: _listGroup.map((value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _sGroup = value as String;
                  });
                }),
          ),
          const Text('Service Type'),
          Container(
            margin: const EdgeInsets.all(20),
            child: DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(width: 3, color: Colors.white),
                  ),
                ),
                isExpanded: true,
                hint: const Text("Select Your Service Type"),
                value: _sType,
                items: _listType.map((value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _sType = value as String;
                  });
                }),
          )
        ],
      ),
    );
  }

  Widget _filterChip() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Channels',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: ["Whatsapp", "Telegram", "Slack", "Coster", "Custom"]
                  .map((filter) {
                return FilterChip(
                  label: Text(filter),
                  selected: _flters.contains(filter),
                  onSelected: (val) {
                    setState(() {
                      if (val) {
                        _flters.add(filter);
                      } else {
                        _flters.removeWhere((name) {
                          return name == filter;
                        });
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _captcha() {
  //   return Container(
  //     child: const WebView(
  //       initialUrl: 'https://jatismobile.com/',
  //       javascriptMode: JavascriptMode.unrestricted,
  //     ),
  //   );
  // }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const SignInSc()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xffe46b10)),
          children: [
            TextSpan(
              text: 'SIGN UP',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("PIC Name"),
        _entryField("Company Name"),
        _entryField("Email/Username"),
        _entryDropdown(),
        _filterChip(),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  Widget _rememberMe() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              },
            ),
          ),
          Text('Remember me', style: TextStyle(fontSize: 16))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignInSc()));
        },
        style: ElevatedButton.styleFrom(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0))),
        child: Text(
          'SIGN UP',
          style: TextStyle(
            color: Colors.black54,
            letterSpacing: 1.5,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: Container()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    const SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    _rememberMe(),
                    const SizedBox(
                      height: 10,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceGroup {
  String name;
  ServiceGroup(this.name);
}
// String selectServiceg = "";
// final _dropDown = TextEditingController();


