import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title:"My App",
      home: TodoList(),
    )

  );
  
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List todoItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("My TODO List"),
        ),
      body:CreateTodoList(),
      floatingActionButton:FloatingActionButton(
        onPressed: navigateTodoScreen,
        tooltip: "Create Task",
        child: Icon(Icons.add),),
        floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
        );
        }

        void navigateTodoScreen(){
          Navigator.of(context).push(MaterialPageRoute(
            builder:(context){
              return Scaffold(
                appBar: AppBar(
                  title:Text("Add Your Task"),
                  
                ),
                body:TextField(
                  autofocus: true,
                  onSubmitted: (val){
                    addItem(val);
                    Navigator.pop(context);
                  },
                  // decoration: ,
                    
                  ),

              );
            }
          ));
          }

          // completed navigatorscreen

          void addItem(String val){
            if (val.length>0){
              setState(() {
                todoItems.add(val);
              });
            }
          }
         

        Widget CreateTodoList () {
          return ListView.builder(
            itemCount: todoItems.length,
            itemBuilder: (context, index){
              return CreateTodoItem(todoItems[index], 
              index);
              },);
              }

              // completed CreateTodolist
            Widget CreateTodoItem ( String todoText, int index ){
                return ListTile(
                  title: Text(todoText),
                  onTap: ()=> showAlertToRemove(index),
                  );
              }

              void showAlertToRemove(int index){
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Want to delete?"),
                      actions:[
                        FlatButton(
                          child: Text("Cancel"),
                          onPressed: ()=>
                          Navigator.of(context).pop(),
                          ),
                          FlatButton(
                            child: Text("Delete"),
                            onPressed: (){
                               deleteTodoItem(index);
                                Navigator.of(context).pop();

                            },
                          )
                           
                            ],
                            );
                  });
              }
              void deleteTodoItem(int index){
                setState(() {
                  todoItems.removeAt(index);
                });
              }
              


}
