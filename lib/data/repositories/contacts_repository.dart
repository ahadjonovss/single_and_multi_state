import 'package:bloc_task/data/models/contact_model.dart';
import 'package:sqflite/sqflite.dart';

class ContactsRepository{
  Database? db;
  String tableName="Contacts";

  ContactsRepository(){
    db = createDatabase();
  }

  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = databasesPath+'contacts.db';

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE $tableName ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "number TEXT,"
        "createdAt TEXT"
        ")");
  }

  Future<int> createCustomer(ContactModel contactModel) async {
    var result = await db!.insert(tableName, contactModel.toJson());
    return result;
  }

  Future<List> getCustomers() async {
    var result = await db!.query(tableName, columns: ["id", "name", "number", "createdAt"]);

    return result.toList();
  }

  Future<int> updateCustomer(ContactModel contactModel) async {
    return await db!.update(tableName, contactModel.toJson(), where: "id = ?", whereArgs: [contactModel.id]);
  }
}