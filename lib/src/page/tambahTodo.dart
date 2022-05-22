import 'package:flutter/material.dart';

class TambahTodo extends StatefulWidget {
  const TambahTodo({Key? key}) : super(key: key);

  @override
  State<TambahTodo> createState() => _TambahTodoState();
}

class _TambahTodoState extends State<TambahTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          'Tambah Todo',
          style: TextStyle(fontSize: 60, color: Colors.white),
        ),
      ),
    );
  }
}
