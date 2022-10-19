import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';
import 'widget/dialog_box.dart';
import 'widget/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isActive = false;
  final controller = TextEditingController();

  //Auto Generated
  List toDoList = [];

  //Function

  // check if internet is available
  Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
  }

  void saveEditedTask(int index) {
    setState(() {
      toDoList[index][0] = controller.text;
      controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBox(
          controller: controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void editTask(int index) {
    controller.text = toDoList[index][0];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBox(
          controller: controller,
          onSave: () => saveEditedTask(index),
          onCancel: () => Navigator.of(context).pop(),
          index: index,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PartaListe",
          style: GoogleFonts.poppins(
            letterSpacing: 1,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isActive = !isActive;
              });
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
          size: 24.0,
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: toDoList.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return ToDoTile(
              leading: "${index + 1}",
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
              editFunction: (context) => editTask(index),
            );
          },
        ),
      ),
    );
  }
}
