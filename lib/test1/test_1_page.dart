import 'package:final_test/database_helper.dart';
import 'package:final_test/model_objects/task.dart';
import 'package:final_test/test1/test_1_form_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Test1Page extends StatefulWidget {
  @override
  _Test1PageState createState() => _Test1PageState();
}

class _Test1PageState extends State<Test1Page> {
  List<Task> _list = [];

  AppBar _appBar() {
    return AppBar(title: Text("test 1"));
  }

  Widget _body() {
    if (_list.isEmpty)
      return Container(
          child: Center(
              child: Text("No Data",
                  style: TextStyle(fontSize: 30, color: Colors.grey))));

    return ListView(
        children:
            _list.map((_list) => _customItem(numberItem: _list)).toList());
  }

  Widget _customItem({required final Task numberItem}) {
    return ListTile(
        title: Text("$numberItem"),
        onTap: () => _onTapItem(removeNumber: numberItem));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: _fabGoToForm(),
    );
  }

  Widget _fabGoToForm() {
    setState(() {});
    return FloatingActionButton.extended(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Test1FormPage()))
            .whenComplete(() => _readDataFromDB()),
        label: Text("Add Task"),
        icon: Icon(Icons.add));
  }

  void _onTapItem({required final Task removeNumber}) {
    _list.remove(removeNumber);
    setState(() {});
  }

  void _readDataFromDB() async {
    final Database? db = await DatabaseHelper.db.database;
    List<dynamic>? results = await db!.query("task");
    /*if (results == null || results.isEmpty) return null;
    _list = results.map((result) => Task.fromMapSQL(result)).toList();*/
  }
}
