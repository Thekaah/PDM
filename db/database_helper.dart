// db/database_helper.dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = 'myDatabase.db';
  static final _databaseVersion = 1;

  static final tableUser = 'user';
  static final tablePergunta = 'pergunta';

  static final columnId = 'id';

  static final columnUsername = 'username';
  static final columnPassword = 'password';

  static final columnPerguntaText = 'perguntaText';
  static final columnUserId = 'userId';

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
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableUser (
        $columnId INTEGER PRIMARY KEY,
        $columnUsername TEXT,
        $columnPassword TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $tablePergunta (
        $columnId INTEGER PRIMARY KEY,
        $columnPerguntaText TEXT,
        $columnUserId INTEGER,
        FOREIGN KEY ($columnUserId) REFERENCES $tableUser($columnId)
      )
    ''');
  }

  // Adicione um método para inicializar o banco de dados
  Future<void> initializeDatabase() async {
    _database = await _initDatabase();
  }
}
