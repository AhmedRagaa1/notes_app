
import 'package:flutter/material.dart';
import 'package:sqfilte/Home_App_note.dart';
import 'package:sqfilte/Sqfilte.dart';

class EditScreen extends StatefulWidget {
    final note;
    final title;
    final id;

     EditScreen ({Key? key, this.note, this.title, this.id}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen>
{

  Sql sql = Sql();

  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    note.text = widget.note;
    title.text = widget.title;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
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
                      int response = await sql.updateData('''
                           UPDATE  notes SET 
                           note = "${note.text}" , 
                           title = "${title.text}"
                           WHERE id = ${widget.id}
                           
                           
                           ''');

                      if(response > 0)
                      {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (context) => HomeApp()), (route) => false);
                      }

                      print("response**********************");
                      print("${response}");

                    },
                    child: Text(
                      'Edit Note',
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
