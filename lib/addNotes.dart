
import 'package:flutter/material.dart';
import 'package:sqfilte/Home_App_note.dart';
import 'package:sqfilte/Sqfilte.dart';

class AddNotes extends StatefulWidget {

  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes>
{

  Sql sql = Sql();

  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children:
          [
            Form(
              key: formstate,
                child: Column(
                  children:
                  [
                    TextFormField(
                      controller: note,
                      decoration: InputDecoration(
                        hintText: "Note",
                      ),
                    ),
                    TextFormField(
                      controller: title,
                      decoration: InputDecoration(
                        hintText: "title",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () async
                        {
                           int response = await sql.insertData('''
                           INSERT INTO notes(note , title)
                           VALUES("${note.text} ", "${title.text}")
                           
                           ''');

                           if(response > 0)
                           {
                             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                 builder: (context) => HomeApp()), (route) => false);
                           }

                           print("response");
                           print("${response}");



                        },
                      child: Text(
                        'Add Note',
                      ),
                    ),

                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
