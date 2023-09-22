import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toto_list/todo_item.dart';
import 'package:toto_list/todo.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO LIST',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('TODO list'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Stack(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Align(
                    //add zavdannia
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 20,
                              right: 20,
                              top: 20,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.teal,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: _todoController,
                              decoration: const InputDecoration(
                                  hintText: 'Додати завдання',
                                  border: InputBorder.none),
                            ),
                          ),
                        ), //textfield
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 20,
                            top: 20,
                          ),
                          child: ElevatedButton(
                            onPressed: ()
                            {
                              _addToDoItem(_todoController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              minimumSize: const Size(60, 60),
                              elevation: 10,
                            ),
                            child: const Text(
                              '+',
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ) //addbutton
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                        bottom: 20,
                      ),
                      child: const Text(
                        'Завдання',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ), //textzavdannia
                  for (ToDo todoo in todosList)
                    ToDoItem(
                      todo: todoo,
                      onDeleteItem: _deleteToDoItem,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }
}
