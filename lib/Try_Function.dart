import 'package:flutter/material.dart';
import 'package:sqfilte/Sqfilte.dart';
class TryFunction extends StatelessWidget {

  Sql sql = Sql();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children:
        [
          Center(
            child: MaterialButton(
              color: Colors.amber,
                onPressed: () async
                {
                  int response = await sql.insertData("INSERT INTO 'notes' ('note' , 'title') VALUES ('note one Ahmed' , 'ahmed ') ");
                  print(response);

                },
              child: Text(
                'insert data',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: MaterialButton(
              color: Colors.amber,
              onPressed: () async
              {
                List<Map> response = await sql.selectData("SELECT * FROM 'notes'");
                print(response);

              },
              child: Text(
                'Select data',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: MaterialButton(
              color: Colors.amber,
              onPressed: () async
              {
                int response = await sql.deleteData("DELETE  FROM 'notes' WHERE id = 1");
                print(response);

              },
              child: Text(
                'delete data',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: MaterialButton(
              color: Colors.amber,
              onPressed: () async
              {
                int response = await sql.updateData("UPDATE 'notes' SET 'note' = 'note mohamed' WHERE id = 3 ");
                print(response);

              },
              child: Text(
                'update data',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
