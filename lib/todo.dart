class ToDo {
  String? id;
  String? todoText;


  ToDo({
    required this.id,
    required this.todoText,

  });

  static List <ToDo> todoList(){
    return[
       ToDo(id: '01', todoText: 'todoText1',),
      ToDo(id: '02', todoText: 'sendMessage',),
    ];
  }
}
