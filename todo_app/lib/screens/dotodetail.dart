import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/util/dbhelper.dart';
import 'package:intl/intl.dart';

final List<String> choices = const <String>[
  'Save Todo & Back',
  'Delete Todo',
  'Back to list'
];

DbHelper helper = DbHelper();
const mnuSave = 'Save Todo & Back';
const mnuDelete = 'Delete Todo';
const mnuBack = 'Back to list';

class TodoDetail extends StatefulWidget {
  final Todo todo;
  TodoDetail(this.todo);

  @override
  State<StatefulWidget> createState() => TodoDetailState(todo);
}

class TodoDetailState extends State {
  Todo todo;
  TodoDetailState(this.todo);
  final List<String> _priorities = ["High", "Medium", "Low"];
  String _priority = "Low";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(todo.title),
          actions: <Widget>[
            PopupMenuButton(
                onSelected: select,
                itemBuilder: (BuildContext context) {
                  return choices.map((String choice) {
                    return PopupMenuItem(value: choice, child: Text(choice));
                  }).toList();
                })
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
          child: ListView(children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  style: textStyle,
                  decoration: InputDecoration(
                      labelStyle: textStyle,
                      labelText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: descriptionController,
                    style: textStyle,
                    decoration: InputDecoration(
                        labelStyle: textStyle,
                        labelText: 'Description',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                ListTile(
                    title: DropdownButton<String>(
                        icon: const Icon(Icons.arrow_downward),
                        items: _priorities
                            .map<DropdownMenuItem<String>>((String value1) {
                          debugPrint('items S ' + value1);
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                        value: "Low",
                        onChanged: null))
              ],
            )
          ]),
        ));
  }

  Future<void> select(String value) async {
    int result;
    switch (value) {
      case mnuSave:
        save();
        break;
      case mnuDelete:
        Navigator.pop(context, true);
        if (todo.id == null) {
          return;
        }
        result = await helper.deleteTodo(todo.id);
        if (result != 0) {
          AlertDialog alertDialog = AlertDialog(
            title: Text('Delete todo'),
            content: Text('The todo has been deleted'),
          );
          showDialog(context: context, builder: (_) => alertDialog);
        }
        break;
      case mnuBack:
        Navigator.pop(context, true);
        break;
    }
  }

  void save() {
    todo.date = new DateFormat.yMd().format(DateTime.now());
    if (todo.id != null) {
      helper.updateTodo(todo);
    } else {
      helper.insetTodo(todo);
    }
    Navigator.pop(context, true);
  }

  void uodatePriority(String value) {
    switch (value) {
      case 'High':
        todo.priority = 1;
        break;
      case 'Medium':
        todo.priority = 2;
        break;
      case 'Low':
        todo.priority = 3;
        break;
      default:
    }
  }
}
