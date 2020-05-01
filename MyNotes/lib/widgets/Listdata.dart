import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytask/widgets/addnotes.dart';
import 'package:mytask/utils/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:mytask/models/notes.dart';

class Listdata extends StatefulWidget {
  @override
  _ListdataState createState() => _ListdataState();
}

class _ListdataState extends State<Listdata> {
  Note note;

  DbHelper databaseHelper = DbHelper();
  List<Note> notelist;
  int count = 0;
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (notelist == null) {
      notelist = List<Note>();
      updateListView();
    }
    return Expanded(
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
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: priorityColor(
                                  this.notelist[position].priority),
                              radius: 27,
                              child: priorityIcon(
                                  this.notelist[position].priority),
                            ),
                            title: Text((this.notelist[position].title),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Colors.black,
                                  letterSpacing: 1.0,
                                )),
                            subtitle: Text((this.notelist[position].date),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black,
                                  letterSpacing: 1.0,
                                )),
                            trailing: Text((this.notelist[position].date),
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                )),
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
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //color: Color(0xff434359),
                      color: Colors.white,
                    )),
              );
            }));
  }

  Widget dismissalbg() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffEA7773),
        borderRadius: BorderRadius.circular(10.0),
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
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget counter() {
    return Text("$count",
        style: GoogleFonts.manrope(
          fontWeight: FontWeight.w400,
          fontSize: 45,
          color: Colors.white60,
          letterSpacing: 1.0,
        ));
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
