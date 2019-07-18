import 'package:flutter/material.dart';
import 'package:flutter_masters/models/todo.dart';
import 'package:flutter_masters/pages/tododetailpage.dart';

class TodoPage extends StatelessWidget {
  static final araguy = ['one', 'two', 'three', 'four', 'five'];
  static final aragux = [
    'you\'re like a dream come true',
    'just wanna be with you',
    'coz it\'s plain to see that you\'re the only one for me',
    'repeat steps one through three',
    'make you fall in love with me'
  ];

  final todos = List<Todo>.generate(
    5,
    (i) => Todo(
      araguy[i],
      aragux[i],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("when all are done, start back at 1"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(this.todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoDetailPage(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
