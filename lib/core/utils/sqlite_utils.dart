import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../data/transaction/model/credit_card_model.dart';

class DatabaseHelper {
  static final _databaseName = "CreditCardDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'credit_card';

  static final columnId = 'id';
  static final columnCardNumber = 'cardNumber';
  static final columnOwner = 'owner';
  static final columnExpiry = 'expiry';
  static final columnIsPrimary = 'isPrimary';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnCardNumber TEXT NOT NULL,
            $columnOwner TEXT NOT NULL,
            $columnExpiry TEXT NOT NULL,
            $columnIsPrimary INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(CreditCardModel card) async {
    Database db = await database;
    return await db.insert(table, card.toMap());
  }

  Future<List<CreditCardModel>> queryAllCards() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return CreditCardModel.fromMap(maps[i]);
    });
  }
}
