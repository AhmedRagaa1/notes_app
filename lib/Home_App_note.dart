import 'package:flutter/material.dart';
import 'package:sqfilte/Sqfilte.dart';
import 'package:sqfilte/edit_notes.dart';

class HomeApp extends StatefulWidget {


  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  Sql sql = Sql();
  bool isLoading = true;

  List notes = [];

  Future selectData() async
  {
    List<Map> response = await sql.selectData("SELECT * FROM 'notes'");
    notes.addAll(response);
    isLoading = false ;
    if(this.mounted)
    {
      setState(() {

      });
    }
    return response;

  }

  @override
  void initState()
  {
    selectData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
      {
        Navigator.of(context).pushNamed("addNotes");

      },
        child: Icon(
          Icons.add,
        ),

      ),
      body: isLoading == true ?
          Center(
            child: Text(
              'Loading*****',
            ),
          )
     : Container(
        child: ListView(
          children:
          [
             ListView.builder(
                   physics: NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     itemCount: notes.length,
                     itemBuilder: (context , i)
                     {
                       return Card(child: ListTile(
                         title: Text("${notes[i]['title']}"),
                         subtitle: Text("${notes[i]['note']}"),
                         trailing: Row(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             IconButton(
                               onPressed: () async
                               {
                                 int response = await sql.deleteData("DELETE FROM notes WHERE id = ${notes[i]['id']} ");
                                 if(response > 0)
                                 {
                                   notes.removeWhere((element) => element['id'] == notes[i]['id']);
                                   setState(() {

                                   });
                                 }
                               },
                               icon: Icon(
                                 Icons.delete,
                                 color: Colors.red,
                               ),
                             ),
                             IconButton(
                               onPressed: () async
                               {
                                 Navigator.of(context).push(
                                   MaterialPageRoute(builder: (context)  => EditScreen(
                                     title: notes[i]['title'],
                                     note: notes[i]['note'],
                                     id: notes[i]['id'],
                                   ))
                                 );

                               },
                               icon: Icon(
                                 Icons.edit,
                                 color: Colors.blue,
                               ),
                             ),
                           ],
                         ),
                       ));

                     }
                     )


          ],
        ),
      ),
    );
  }
}
