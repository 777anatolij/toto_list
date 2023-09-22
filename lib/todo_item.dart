import 'package:flutter/material.dart';
import 'package:toto_list/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final  onDeleteItem;

  const ToDoItem({Key? key, required this.todo, required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
            //margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.blueGrey[900],
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
