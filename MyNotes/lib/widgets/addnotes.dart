import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mytask/utils/db_helper.dart';
import 'package:mytask/models/notes.dart';

class AddNote extends StatefulWidget {
  final String appbartitle;
  final Note note;
  AddNote(this.note, this.appbartitle);

  @override
  _AddNoteState createState() => _AddNoteState(this.note, this.appbartitle);
}

class _AddNoteState extends State<AddNote> {
  DbHelper helper = DbHelper();

  static var _priorities = ['High', 'Low'];

  String appbartitle;

  Note note;
  _AddNoteState(this.note, this.appbartitle);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void upadateTitle() {
    note.title = titleController.text;
  }

  void updateDescription() {
    note.title = descriptionController.text;
  }

  @override
  Widget build(BuildContext context) {
    titleController.text = note.title;
    descriptionController.text = note.description;
    return Scaffold(
      backgroundColor: Color(0xffEA7773),
      appBar: AppBar(
        title: Text(
          appbartitle,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w600,
            fontSize: 30,
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xffEA7773),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xff333945),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: ListView(children: <Widget>[
          titlefield(),
          descriptionfield(),
          dropDown(),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _save();
        },
        child: Icon(Icons.check),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  Widget titlefield() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
      child: TextField(
        controller: titleController,
        onChanged: (value) {
          upadateTitle();
        },
        style: TextStyle(
             color: Color(0xffffffff),
            fontWeight: FontWeight.w400,
            fontSize: 20,
            letterSpacing: 1.0),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: "Note title.",
          hintStyle: TextStyle(
              fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w300),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: new BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget descriptionfield() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
      child: TextField(
        maxLines: 8,
        controller: descriptionController,
        onChanged: (value) {
          updateDescription();
        },
        style: TextStyle(
            color: Color(0xffffffff),
            fontWeight: FontWeight.w400,
            fontSize: 25,
            letterSpacing: 1.0),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: "Description.",
          hintStyle: TextStyle(
              fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.w300),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: new BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget dropDown() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color(0xffEA7773),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Priority :",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: Colors.white,
                    letterSpacing: 1.0,
                  )),
              DropdownButton<String>(
                items: _priorities.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                value: getPriorityAsString(note.priority),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
                onChanged: (valueSelectedByUser) {
                  setState(() {
                    updatePriorityAsInt(valueSelectedByUser);
                  });
                },
              ),
            ],
          ),
        ));
  }

  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
    }
  }

  void _save() async {
    note.date = DateFormat.yMMMd().format(DateTime.now());
    if (note.id != null) {
      await helper.updateNote(note);
    } else {
      await helper.insertNote(note);
    }
    Navigator.pop(context, true);
  }

  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0];
        break;
      case 2:
        priority = _priorities[1];
        break;
    }
    return priority;
  }
}
