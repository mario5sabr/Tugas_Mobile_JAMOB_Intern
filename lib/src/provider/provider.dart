import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:internmobile/src/page/chat.dart';

import '../page/homeSC.dart';
import '../page/tambahTodo.dart';

class ProviderBar extends StatefulWidget {
  const ProviderBar({Key? key}) : super(key: key);

  @override
  State<ProviderBar> createState() => _ProviderBarState();
}

class _ProviderBarState extends State<ProviderBar> {
  GlobalKey<CurvedNavigationBarState> _globalKey = GlobalKey();
  var pages = [
    HomeSC(),
    TambahTodo(),
    ChatTxt(),
  ];
  var myIndex = 0;
  @override
  final List<Widget> items = [
    Icon(Icons.home, size: 30),
    Icon(Icons.search, size: 30),
    Icon(Icons.chat, size: 30),
    Icon(Icons.check_box_outlined, size: 30),
    Icon(Icons.person, size: 30),
  ];
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            extendBody: true,
            body: pages[myIndex],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(color: Colors.white),
              ),
              child: CurvedNavigationBar(
                  key: _globalKey,
                  color: Colors.orange.shade200,
                  buttonBackgroundColor: Colors.orange.shade400,
                  backgroundColor: Colors.transparent,
                  height: 60,
                  animationCurve: Curves.easeInOut,
                  animationDuration: Duration(microseconds: 300),
                  index: myIndex,
                  items: items,
                  onTap: (index) {
                    setState(() {
                      myIndex = index;
                    });
                  }),
            ),
          ),
        ));
  }
}
