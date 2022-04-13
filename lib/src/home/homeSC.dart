import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class HomeSC extends StatefulWidget {
  const HomeSC({Key? key}) : super(key: key);

  @override
  State<HomeSC> createState() => _HomeSCState();
}

class _HomeSCState extends State<HomeSC> {
  List todos = List.empty();
  String title = "";
  String description = "";

  @override
  void initState() {
    super.initState();
    todos = ["Hello", "Hey There"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
                left: 8,
                right: 0,
                bottom: 0,
                top: 16,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.orange,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            "Hello, ",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            "Test",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 16),
                        child: Row(
                          children: const [
                            Text(
                              "2 New",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            Text(
                              " Tasks today",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 240,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 14),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 80,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Center(
                                    child: Text("$index"),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 16),
                        child: Row(
                          children: [
                            const Text(
                              "To",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            const Text(
                              " Do",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.blue[100],
                              foregroundColor: Colors.black,
                              child: Text("3"),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 130,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: todos.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 14),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                      color: Colors.green[400],
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Center(
                                    child: ListTile(
                                      title: Text(todos[index]),
                                      subtitle: Text("Description"),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.delete),
                                        color: Colors.red,
                                        onPressed: () {
                                          setState(() {
                                            todos.removeAt(index);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 16),
                        child: Row(
                          children: [
                            const Text(
                              "In",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            const Text(
                              " Progress",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.red[100],
                              foregroundColor: Colors.black,
                              child: Text("5"),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 88,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Card(
                              elevation: 4,
                              child: Row(
                                children: <Widget>[],
                              ),
                            ),
                          )),
                    ],
                  ),
                )),
            Positioned(
                left: 16,
                right: 16,
                bottom: 8,
                child: Container(
                  height: 64,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            offset: Offset(1, 2))
                      ]),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.home, color: Colors.orange, size: 32),
                          SizedBox(
                            height: 4,
                          ),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.orange,
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search,
                              color: Colors.orange[200], size: 32),
                          // SizedBox(
                          //   height: 4,
                          // ),
                          // CircleAvatar(
                          //   radius: 3,
                          //   backgroundColor: Colors.orange,
                          // )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_box_outlined,
                              color: Colors.orange[200], size: 32),
                          // SizedBox(
                          //   height: 4,
                          // ),
                          // CircleAvatar(
                          //   radius: 3,
                          //   backgroundColor: Colors.orange,
                          // )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Badge(
                            child: Icon(Icons.notifications_outlined,
                                color: Colors.orange[200], size: 32),
                          )

                          // SizedBox(
                          //   height: 4,
                          // ),
                          // CircleAvatar(
                          //   radius: 3,
                          //   backgroundColor: Colors.orange,
                          // )
                        ],
                      ),
                      const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.orange,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
