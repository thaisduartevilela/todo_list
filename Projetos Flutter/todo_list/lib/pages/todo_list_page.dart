import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget
{
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom:20),
              child: Form(
                //key: _formKey,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                     // controller: taskController,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black87
                      ),
                      decoration: InputDecoration(
                          hintText: 'Type a new task here...',
                          hintStyle: TextStyle(
                              fontSize: 20
                          )
                        ),
                      keyboardType: TextInputType.text,
                /*validator: (value){
                     if (value.isEmpty){
                        return 'Task field it is required';
                      }
                      return null;
                }*/
                    ),
                  ),

                       FloatingActionButton(
                        child: const Icon(Icons.add),
                        onPressed: () {
                          print('CLIQUEI...');
                        }
                      )
                ],
              ),
            )
            ),
          ],
        ),
      ),
    );
  }
}