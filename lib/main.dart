import 'dart:async';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'sC1c2tohzG1iGusMq69oT69bHQN760q4obwkaept';
  final keyClientKey = 'ohZ3Vi3lXHoG8opjoNikxvCLxlVOZVE0tAwTp6K3';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoController = TextEditingController();
  final descriptionController = TextEditingController();

  void addToDo() async {
    if (todoController.text.trim().isEmpty || descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Both title and description are required."),
        duration: Duration(seconds: 2),
      ));
      return;
    }
    await saveTodo(todoController.text.trim(), descriptionController.text.trim());
    setState(() {
      todoController.clear();
      descriptionController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CROSS PLATFORM ASSIGNMENT"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    autocorrect: true,
                    textCapitalization: TextCapitalization.sentences,
                    controller: todoController,
                    decoration: InputDecoration(
                      labelText: "Task Title",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: "Task Content",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: addToDo,
                    child: Text("ADD"),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<ParseObject>>(
                future: getTodo(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: Container(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator()),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error..."),
                        );
                      }
                      if (!snapshot.hasData) {
                        return Center(
                          child: Text("No Data..."),
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final varTodo = snapshot.data![index];
                              final varTitle = varTodo.get<String>('title')!;
                              final varDescription = varTodo.get<String>('description') ?? '';
                              final varDone =  varTodo.get<bool>('done')!;

                              return ListTile(
                                title: Text(varTitle),
                                subtitle: Text(varDescription),
                                leading: CircleAvatar(
                                  child: Icon(
                                      varDone ? Icons.check : Icons.error),
                                  backgroundColor:
                                  varDone ? Colors.green : Colors.blue,
                                  foregroundColor: Colors.white,
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.edit, color: Colors.blue),
                                      onPressed: () async {
                                        String? newDescription = await _updateDescriptionDialog(context, varDescription);
                                        if (newDescription != null && newDescription.trim().isNotEmpty) {
                                        await updateTodo(varTodo.objectId!, varDone, newDescription);
                                        setState(() {
                                        // Refresh UI after updating the description
                                        });
                                        }
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () async {
                                        await deleteTodo(varTodo.objectId!);
                                        setState(() {
                                          final snackBar = SnackBar(
                                            content: Text("Todo deleted!"),
                                            duration: Duration(seconds: 2),
                                          );
                                          ScaffoldMessenger.of(context)
                                            ..removeCurrentSnackBar()
                                            ..showSnackBar(snackBar);
                                        });
                                      },
                                    )
                                  ],
                                ),
                                onTap: () => _viewTaskDetails(context, varTitle, varDescription),
                              );
                            }
                        );
                      }
                  }
                })
          ],
        ),
      ),
    );
  }

  void _viewTaskDetails(BuildContext context, String title, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: <Widget>[
            ElevatedButton(
              child: Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Future<void> saveTodo(String title, String description) async {
    final todo = ParseObject('Task')..
    set('title', title)..
    set('description', description)..
    set('done', false);

    await todo.save();
  }

  Future<List<ParseObject>> getTodo() async {
    QueryBuilder<ParseObject> queryTodo =
    QueryBuilder<ParseObject>(ParseObject('Task'));
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<void> updateTodo(String id, bool done, String description) async {
    var todo = ParseObject('Task')
      ..objectId = id
      ..set('done', done)
      ..set('description', description);
    await todo.save();
  }

  Future<void> deleteTodo(String id) async {
    var todo = ParseObject('Task')..objectId = id;
    await todo.delete();
  }

  Future<String?> _updateDescriptionDialog(BuildContext context, String currentDescription) async {
    TextEditingController descriptionController = TextEditingController(text: currentDescription);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Update Description"),
          content: TextField(
            controller: descriptionController,
            maxLines: 3,
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text("Update"),
              onPressed: () => Navigator.of(context).pop(descriptionController.text),
            ),
          ],
        );
      },
    );
  }
}



