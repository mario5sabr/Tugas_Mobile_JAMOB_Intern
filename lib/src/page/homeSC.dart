import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:internmobile/src/home/partProgress/task.dart';
import 'package:internmobile/src/list/dataTask.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class HomeSC extends StatefulWidget {
  const HomeSC({Key? key}) : super(key: key);

  @override
  State<HomeSC> createState() => _HomeSCState();
}

class _HomeSCState extends State<HomeSC> {
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
                            itemCount: taskItems.length,
                            itemBuilder: (context, index) {
                              var profileLength = taskItems[index]
                                      .taskRelate
                                      ?.profileCount
                                      ?.length ??
                                  0;
                              return Padding(
                                padding: const EdgeInsets.only(right: 14),
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => TaskDetail(
                                              task: taskItems[index]))),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 80,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                    // child: Center(
                                    //   child: Text("$index"),
                                    // ),
                                    padding: EdgeInsets.only(
                                        top: 16,
                                        right: 20,
                                        bottom: 8,
                                        left: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          taskItems[index].title ??
                                              "Unknown Task Name",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.flag,
                                                color: Colors.red,
                                                size: 18,
                                              ),
                                              Text(
                                                taskItems[index].dueDateTime ??
                                                    "Unknown Date",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          taskItems[index].description ??
                                              "Unknown Task Name",
                                          style: const TextStyle(
                                            // fontSize: 14,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 48,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: taskItems[index]
                                                      .taskTags
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index2) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16,
                                                          top: 8,
                                                          bottom: 8),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: taskItems[index]
                                                          .taskTags?[index2]
                                                          .color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    ),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 16,
                                                        vertical: 8),
                                                    child: Center(
                                                      child: Text(
                                                        taskItems[index]
                                                                .taskTags?[
                                                                    index2]
                                                                .tag ??
                                                            "Unknown Tag",
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                        SizedBox(
                                          height: 48,
                                          child: Stack(
                                            children: [
                                              for (int i = 0;
                                                  i < profileLength;
                                                  i++)
                                                Positioned(
                                                  left: i * 16,
                                                  top: 0,
                                                  bottom: 0,
                                                  child: CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(taskItems[
                                                                        index]
                                                                    .taskRelate
                                                                    ?.profileCount?[
                                                                i] ??
                                                            ""),
                                                  ),
                                                ),
                                              Positioned(
                                                child: Center(
                                                    child: Text(
                                                        "+ ${taskItems[index].taskRelate?.counter ?? ""}")),
                                                left: 32,
                                                right: 0,
                                                bottom: 0,
                                                top: 0,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
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
                            ),
                          ],
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     SizedBox(
                      //       width: 8,
                      //     ),
                      //     IconButton(
                      //       tooltip: "Add Task",
                      //       icon: const Icon(Icons.add),
                      //       color: Colors.green,
                      //       onPressed: () {
                      //         showDialog(
                      //             context: context,
                      //             builder: (BuildContext context) {
                      //               return AlertDialog(
                      //                 shape: RoundedRectangleBorder(
                      //                   borderRadius: BorderRadius.circular(16),
                      //                 ),
                      //                 title: const Text("Add Todo"),
                      //                 content: Container(
                      //                   width: 400,
                      //                   height: 100,
                      //                   child: Column(
                      //                     children: [
                      //                       TextField(
                      //                         onChanged: (String value) {
                      //                           title = value;
                      //                         },
                      //                       ),
                      //                       TextField(
                      //                         onChanged: (String value) {
                      //                           description = value;
                      //                         },
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //                 actions: <Widget>[
                      //                   TextButton(
                      //                       onPressed: () {
                      //                         setState(() {
                      //                           todos.add(title);
                      //                           // createTodo();
                      //                         });
                      //                         Navigator.of(context).pop();
                      //                       },
                      //                       child: const Text("Add")),
                      //                 ],
                      //               );
                      //             });
                      //       },
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 130,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: taskTodoItems.length,
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                      color: taskTodoItems[index].priority ==
                                              "Urgent"
                                          ? Colors.red[100]
                                          : Colors.blue[100],
                                      borderRadius: BorderRadius.circular(16)),
                                  padding: EdgeInsets.only(
                                      top: 16, bottom: 16, left: 16, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        taskTodoItems[index].priority,
                                        style: TextStyle(
                                          color:
                                              taskTodoItems[index].priority ==
                                                      "Urgent"
                                                  ? Colors.red
                                                  : Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        taskTodoItems[index].title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.access_time_filled,
                                            color: Colors.red,
                                            size: 14,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            taskTodoItems[index].dueDateTime,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
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
            // Positioned(
            //     left: 16,
            //     right: 16,
            //     bottom: 8,
            //     child: Container(
            //       height: 64,
            //       decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(16),
            //           boxShadow: [
            //             BoxShadow(
            //                 color: Colors.white.withOpacity(0.2),
            //                 offset: Offset(1, 2))
            //           ]),
            //       padding: EdgeInsets.symmetric(horizontal: 16),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: <Widget>[
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: const [
            //               Icon(Icons.home, color: Colors.orange, size: 32),
            //               SizedBox(
            //                 height: 4,
            //               ),
            //               CircleAvatar(
            //                 radius: 3,
            //                 backgroundColor: Colors.orange,
            //               )
            //             ],
            //           ),
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Icon(Icons.search,
            //                   color: Colors.orange[200], size: 32),
            //             ],
            //           ),
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Icon(Icons.check_box_outlined,
            //                   color: Colors.orange[200], size: 32),
            //             ],
            //           ),
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Badge(
            //                 child: Icon(Icons.notifications_outlined,
            //                     color: Colors.orange[200], size: 32),
            //               )
            //             ],
            //           ),
            //           const CircleAvatar(
            //             radius: 15,
            //             backgroundColor: Colors.orange,
            //           )
            //         ],
            //       ),
            //     ))
          ],
        ),
      ),
    );
  }
}
