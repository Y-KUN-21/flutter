import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytask/models/notes.dart';
import 'package:mytask/widgets/addnotes.dart';
import 'package:mytask/utils/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DbHelper databaseHelper = DbHelper();
  Note note;
  List<Note> notelist;
  int count = 0;
  String description;
  String date = DateFormat.yMMMMEEEEd().format(DateTime.now());
  Color priorityColor(int priority) {
    switch (priority) {
      case 1:
        return Color(0xffEA7773);
        break;
      case 2:
        return Color(0xff67E6DC);
        break;
      default:
        return Color(0xff74B9FF);
    }
  }

  Icon priorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(
          Icons.keyboard_arrow_up,
          color: Colors.white,
          size: 25,
        );
        break;
      case 2:
        return Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
          size: 25,
        );
        break;
      default:
        return Icon(
          Icons.keyboard_arrow_right,
          color: Colors.white,
          size: 25,
        );
    }
  }

  void _delete(BuildContext context, Note note) async {
    await databaseHelper.deleteNote(note.id);
  }

  @override
  Widget build(BuildContext context) {
    if (notelist == null) {
      notelist = List<Note>();
      updateListView();
    }
    return Scaffold(
      backgroundColor: Color(0xffEA7773),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Container(
                height: 140,
                width: 450,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'My notes. ',
                            style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w900,
                                fontSize: 40,
                                letterSpacing: 3.0,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$date',
                            style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                letterSpacing: 2.0,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Text("$count",
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w400,
                            fontSize: 45,
                            color: Colors.white60,
                            letterSpacing: 1.0,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff333945),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25))),
              child: ListView.builder(
                  itemCount: count,
                  itemBuilder: (context, int position) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
                      child: Container(
                          height: 100,
                          child: Card(
                            child: Dismissible(
                              background: dismissalbg(),
                              direction: DismissDirection.endToStart,
                              key: UniqueKey(),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return AddNote(
                                        this.notelist[position], "Edit note");
                                  }));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: priorityColor(
                                            this.notelist[position].priority),
                                        radius: 27,
                                        child: priorityIcon(
                                            this.notelist[position].priority),
                                      ),
                                      title:
                                          Text((this.notelist[position].title),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.manrope(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                                color: Colors.white,
                                                letterSpacing: 1.0,
                                              )),
                                      subtitle:
                                          Text((this.notelist[position].date),
                                              maxLines: 1,
                                              style: GoogleFonts.manrope(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                                color: Colors.white,
                                                letterSpacing: 1.0,
                                              )),
                                    ),
                                  ],
                                ),
                              ),
                              onDismissed: (direction) {
                                setState(() {
                                  _delete(context, notelist[position]);
                                  updateListView();
                                });
                              },
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            color: Color(0xff333945),
                          )),
                    );
                  }),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add new note.",
        onPressed: () {
          navigateToNoteDetail(Note('', '', 2), "Add note");
        },
        backgroundColor: Color(0xffEA7773),
        child: Icon(Icons.note_add),
      ),
    );
  }

  Widget dismissalbg() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffEA7773),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.delete_sweep,
              size: 35,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              color: Color(0xffEA7773),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToNoteDetail(Note note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddNote(note, title);
    }));
    if (result) {
      updateListView();
    }
  }

  void updateListView() async {
    final Future<Database> dbfuture = databaseHelper.initializeDatabase();
    dbfuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((notelist) {
        setState(() {
          this.notelist = notelist;
          this.count = notelist.length;
        });
      });
    });
  }
}
