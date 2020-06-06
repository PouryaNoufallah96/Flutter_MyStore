import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import '../models/product.dart';

class DB {
  static final String ColID = "id";
  static final String ColTitle = "name";
  static final String ColImage = "image";
  static final String ColPrice = "price";
  static final String ColFavorite = "favorite";
  static final String ColPurchased = "purchased";
  static final String ColDescription = "description";
  static final String DB_Name = "app.db";
  static final String TBL_Name = "ProductTable";

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    var dbpath = await getDatabasesPath();
    var path = join(dbpath, DB_Name);
    var ourdb = await openDatabase(path, version: 1, onCreate: _oncreate);
    return ourdb;
  }

  _oncreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TBL_Name"
        "($ColID INTEGER PRIMARY KEY, $ColTitle TEXT,"
        "$ColImage Text, $ColPrice INTEGER, $ColFavorite BOOLEAN,"
        "$ColPurchased BOOLEAN, $ColDescription TEXT)");
    print("----------- Table Created --------------");
  }

  Future<int> saveProduct(Product product) async {
    var mydb = await db;
    var status = await mydb.insert("$TBL_Name", product.toMap());
    print("product saved.......");
    return status;
  }

  Future<List> getAll() async {
    var mydb = await db;
    var res = await mydb.rawQuery("SELECT * FROM $TBL_Name");
    // print(res.toString());
    return res.toList();
  }

  Future<bool> HasData() async {
    var mydb = await db;
    var res = await mydb.rawQuery("SELECT * FROM $TBL_Name");
    if (res.isEmpty)
      return false;
    else
      return true;
  }

  Future<bool> CheckData(var id) async {
    var mydb = await db;
    var res = await mydb.rawQuery("SELECT * FROM $TBL_Name WHERE $ColID = $id");
    if (res.length == 0)
      return false;
    else
      return true;
  }

  Future<int> DeleteProduct(var id) async {
    var mydb = await db;
    var res = await mydb.delete(TBL_Name, where: "$ColID = ?", whereArgs: [id]);
    return res;
  }

  Future Close() async {
    var mydb = await db;
    mydb.close();
  }
}
