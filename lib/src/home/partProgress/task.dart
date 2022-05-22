import 'package:flutter/material.dart';
import 'package:internmobile/src/model/task.dart';

class TaskDetail extends StatefulWidget {
  final Task task;
  const TaskDetail({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  bool _taskChck = false;
  bool _taskChck2 = false;
  @override
  Widget build(BuildContext context) {
    var profileLength = widget.task.taskRelate?.profileCount?.length ?? 0;
    return Scaffold(
      backgroundColor: Colors.orange[3200],
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                shape: BoxShape.circle),
                            child: Center(
                              child: Icon(Icons.keyboard_arrow_left),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Center(child: Text("Today Task"))),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              color: Colors.orange[200],
                              shape: BoxShape.circle),
                          child: Center(
                            child: Icon(Icons.edit_outlined),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Text(
                widget.task.title ?? "",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                    ),
                    SizedBox(width: 8),
                    Text("Tugas Intern Jatis Mobile",
                        style: TextStyle(color: Colors.orange[100])),
                  ],
                ),
              ),
              Text(
                "${widget.task.description ?? ""}"
                "Design the UI for Intern Mobile",
                style: Theme.of(context).textTheme.headline6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.flag,
                      color: Colors.red,
                      size: 18,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.task.dueDateTime ?? "Unknown Date",
                      style: TextStyle(fontSize: 14, color: Colors.orange[100]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 48,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.task.taskTags?.length ?? 0,
                    itemBuilder: (context, index2) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: widget.task.taskTags?[index2].color,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Center(
                            child: Text(
                              widget.task.taskTags?[index2].tag ??
                                  "Unknown Tag",
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 12),
              SizedBox(
                height: 48,
                child: Stack(
                  children: [
                    for (int i = 0; i < profileLength; i++)
                      Positioned(
                        left: i * 16,
                        top: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              widget.task.taskRelate?.profileCount?[i] ?? ""),
                        ),
                      ),
                    Positioned(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "+ ${widget.task.taskRelate?.counter ?? ""}")),
                      left: 100,
                      right: 0,
                      bottom: 0,
                      top: 0,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text("Subtask"),
              SizedBox(
                height: 8,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.orange[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Interview with client"),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.flag,
                                  color: Colors.orange[50],
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "6 hours",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                )
                              ],
                            )
                          ]),
                      Spacer(),
                      Checkbox(
                          value: _taskChck,
                          onChanged: (b) {
                            setState(() {
                              _taskChck = b ?? false;
                            });
                          })
                    ],
                  )),
              SizedBox(
                height: 8,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.orange[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Interview with client"),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.flag,
                                  color: Colors.orange[50],
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "6 hours",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                )
                              ],
                            )
                          ]),
                      Spacer(),
                      Checkbox(
                          value: _taskChck2,
                          onChanged: (b) {
                            setState(() {
                              _taskChck2 = b ?? false;
                            });
                          })
                    ],
                  )),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add, size: 14),
                label: Text(
                  "Add Subtask",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text("File Upload"),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.file_copy_outlined,
                          size: 14,
                        ),
                        Text(
                          "laporan progress.pdf",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.file_copy_outlined,
                          size: 14,
                        ),
                        Text(
                          "laporan progress.pdf",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
