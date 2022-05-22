import 'package:flutter/material.dart';
import 'package:internmobile/src/model/task_toDo.dart';

import '../model/task.dart';
import '../model/task_relate.dart';
import '../model/task_tag.dart';

List<Task> taskItems = [
  Task(
      title: "UX Design for Intern Mobile",
      dueDateTime: "2022-10-10",
      description:
          "Design the UI for Intern MobileDesign the UI for Intern MobileDesign the UI for Intern MobileDesign the UI for Intern MobileDesign the UI for Intern Mobile",
      taskTags: [
        TaskTag(tag: "UX", color: Colors.blue),
        TaskTag(tag: "5 Score", color: Colors.red)
      ],
      taskRelate: TaskRelate(
        counter: 4,
        profileCount: [
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
          "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
          "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
        ], //profileItems
      )),
  Task(
      title: "Frontend task for Intern Mobile",
      dueDateTime: "Mei 25, 2022",
      description: "Design the UI for Intern Mobile",
      taskTags: [
        TaskTag(tag: "Frontend", color: Colors.yellow),
        TaskTag(tag: "3 Score", color: Colors.red)
      ],
      taskRelate: TaskRelate(
        counter: 4,
        profileCount: [
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
          "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
          "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
        ], //profileItems
      )),
];

List<TaskTodo> taskTodoItems = [
  TaskTodo(
      priority: "Urgent",
      title: "Menambahkan borderdetermine word length",
      dueDateTime: "Sep 10, 2022"),
  TaskTodo(
      priority: "Normal", title: "Icon JATIS", dueDateTime: "Mei 25, 2022"),
  TaskTodo(
      priority: "Normal", title: "Icon JATIS", dueDateTime: "Mei 25, 2022"),
];
