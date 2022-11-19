import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do List',
      home: TodoList(),
    ); // MaterialApp
  }
}

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController taskController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    List<String> _tasks = List.empty();
    return Scaffold(
    appBar:
    AppBar(
      title: Text('To-Do List'),
    ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Form(
                key: _formKey,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: taskController,
                        style: TextStyle(fontSize: 32, color: Colors.black87),
                        decoration: InputDecoration(
                            hintText: 'Type a new task here...',
                            hintStyle: TextStyle(fontSize: 20)),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.trim().isEmpty){
                            return 'Task field it is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: FloatingActionButton(
                        child: const Icon(Icons.add),
                        onPressed: () {
                          debugPrint('Pressed...');
                          if (_formKey.currentState!.validate()) {
                            setState() {
                              _tasks.add(taskController.text);
                            };
                            taskController.clear();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
                child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        title: Text(_tasks[index]),
                      ) ,
                    );
                  },
                )
            )
          ],
        ),
      ),
    );
  }
}