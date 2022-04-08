
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sql
{

  static Database? _db ;

  Future<Database?> get db async
  {
    if(_db == null)
    {
      _db = await intialSq() ;
      return _db;
    }else
      {
        return _db;
      }
  }

  //1
  intialSq() async
  {
    //2
    String DatabasePath = await getDatabasesPath();
    //3
    String path = join(DatabasePath , 'ahmed.db');
    //4
    Database mydb = await openDatabase(path , onCreate: _onCreate , version: 1 , onUpgrade: _onUpgrade );

    return mydb;

  }

  _onUpgrade(Database db , int oldVersion , int newVersion) async
  {

    print("_onUpgrade");
    // db.execute("ALTER TABLE notes ADD COLUMN title TEXT");

  }

  _onCreate(Database db , int version) async
  {
    await db.execute('''
    CREATE TABLE "notes"(
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT,
    "note" TEXT NOT NULL,
    "title" TEXT NOT NULL
    )
    ''');
    print("create*****************");

  }

  //5
  selectData(String sql) async
  {
    Database? mydb = await db ;
    List<Map> response = await mydb!.rawQuery(sql) ;
    return response ;

  }
  //8
  insertData(String sql) async
  {
    Database? mydb = await db ;
    int response = await mydb!.rawInsert(sql) ;
    return response ;

  }
  //6
  updateData(String sql) async
  {
    Database? mydb = await db ;
    int response = await mydb!.rawUpdate(sql) ;
    return response ;

  }
  //7
  deleteData(String sql) async
  {
    Database? mydb = await db ;
    int response = await mydb!.rawDelete(sql) ;
    return response ;

  }

  myDeleteDatabase() async
  {
    String DatabasePath = await getDatabasesPath();
    //3
    String path = join(DatabasePath , 'ahmed.db');
    await deleteDatabase(path);
  }


  select(String table) async
  {
    Database? mydb = await db ;
    List<Map> response = await mydb!.query(table) ;
    return response ;

  }
  //8
  insert(String table , Map<String, Object?> values) async
  {
    Database? mydb = await db ;
    int response = await mydb!.insert(table , values) ;
    return response ;

  }
  //6
  update(String table , Map<String, Object?> values ,String? myWhere) async
  {
    Database? mydb = await db ;
    int response = await mydb!.update(table , values , where: myWhere) ;
    return response ;

  }
  //7
  delete(String table , String myWhere) async
  {
    Database? mydb = await db ;
    int response = await mydb!.delete(table , where: myWhere) ;
    return response ;

  }




}